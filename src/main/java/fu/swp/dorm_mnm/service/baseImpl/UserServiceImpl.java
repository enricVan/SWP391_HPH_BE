package fu.swp.dorm_mnm.service.baseImpl;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fu.swp.dorm_mnm.dto.PageDto;
import fu.swp.dorm_mnm.dto.base.StudentDto;
import fu.swp.dorm_mnm.dto.base.UserDto;
import fu.swp.dorm_mnm.model.Guard;
import fu.swp.dorm_mnm.model.Manager;
import fu.swp.dorm_mnm.model.Role;
import fu.swp.dorm_mnm.model.Student;
import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.repository.base.GuardRepository;
import fu.swp.dorm_mnm.repository.base.ManagerRepository;
import fu.swp.dorm_mnm.repository.base.RoleRepository;
import fu.swp.dorm_mnm.repository.base.StudentRepository;
import fu.swp.dorm_mnm.repository.base.UserRepository;
import fu.swp.dorm_mnm.service.base.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private ManagerRepository managerRepository;

    @Autowired
    private GuardRepository guardRepository;

    @Override
    public Optional<User> findById(Long id) {
        return userRepository.findById(id);
    }

    @Override
    public User save(User news) {
        return userRepository.save(news);
    }

    @Override
    public void remove(Long id) {
        userRepository.deleteById(id);
    }

    @Override
    public Page<User> findAll(int pageNo) {
        Pageable pageable = PageRequest.of(pageNo, 8, Sort.by(Sort.Direction.ASC, "id"));
        return userRepository.findAll(pageable);
    }

    @Override
    public List<UserDto> getUserByRoleId(Long roleId) {

        List<User> users = userRepository.getUserByRole(roleId);

        List<UserDto> udtos = new ArrayList<>();
        for (User u : users) {
            UserDto udto = new UserDto(u);
            udtos.add(udto);
        }
        return udtos;
    }

    @Transactional
    @Override
    public UserDto createUser(UserDto userDto) {

        Optional<Role> roleOptional = roleRepository.findById(userDto.getRoleId());

        if (userDto.getUsername().isEmpty() || !roleOptional.isPresent())
            return null;
        else {
            if (userDto.getPassword().isEmpty()) {
                // gen pass -> send mail
            }

            LocalDateTime now = LocalDateTime.now();
            Timestamp sqlNow = Timestamp.valueOf(now);

            User user = new User();
            user.setUsername(userDto.getUsername());
            user.setPassword(userDto.getPassword());
            user.setRole(roleOptional.get());
            user.setAddress(userDto.getAddress());
            user.setCreatedAt(sqlNow);
            user.setUpdatedAt(sqlNow);
            user.setDateOfBirth(Timestamp.valueOf(userDto.getDob()));
            user.setEmail(userDto.getEmail());
            user.setFullName(userDto.getFullName());
            user.setGender(userDto.getGender());
            user.setPhone(userDto.getPhone());
            user.setStatus("active");

            String roleName = roleOptional.get().getName().toUpperCase();

            if (roleName.equals("ADMIN")) {

                User userDb = userRepository.save(user);
                return new UserDto(userDb);

            } else if (roleName.equals("STUDENT")) {

                Student s = new Student();
                StudentDto sdto = userDto.getStudentDto();
                s.setRollNumber(sdto.getRollNumber());
                s.setParentName(sdto.getParentName());
                s.setCreatedAt(sqlNow);
                s.setUpdatedAt(sqlNow);
                user.setStudent(s);
                User userDb = userRepository.save(user);
                // studentRepository.save(s);
                return new UserDto(userDb);

            } else if (roleName.equals("MANAGER")) {

                User userDb = userRepository.save(user);
                Manager m = new Manager();
                m.setCreatedAt(sqlNow);
                m.setUpdatedAt(sqlNow);
                m.setUser(userDb);
                managerRepository.save(m);
                return new UserDto(userDb);

            } else if (roleName.equals("GUARD")) {

                User userDb = userRepository.save(user);
                Guard g = new Guard();
                g.setCreatedAt(sqlNow);
                g.setUpdatedAt(sqlNow);
                g.setUser(userDb);
                guardRepository.save(g);
                return new UserDto(userDb);

            } else {
                return null;
            }
        }
    }

    @Override
    public PageDto<UserDto> getAllUser(Long roleId, String partialName, Pageable pageable) {
        Page<User> page = userRepository.getAllUser(roleId, partialName, pageable);
        List<User> users = page.getContent();
        List<UserDto> userDtos = new ArrayList<>();
        for (User user : users) {
            userDtos.add(new UserDto(user));
        }
        PageDto<UserDto> pageDto = new PageDto<>();
        pageDto.setData(userDtos);
        pageDto.setCurrentPage(page.getNumber());
        pageDto.setTotalPages(page.getTotalPages());
        pageDto.setTotalItems(page.getTotalElements());
        return pageDto;
    }

}
