package fu.swp.dorm_mnm.service.baseImpl;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import fu.swp.dorm_mnm.dto.ForgetPasswordDto;
import fu.swp.dorm_mnm.dto.PageDto;
import fu.swp.dorm_mnm.dto.base.GuardDto;
import fu.swp.dorm_mnm.dto.base.ManagerDto;
import fu.swp.dorm_mnm.dto.base.StudentDto;
import fu.swp.dorm_mnm.dto.base.UserDto;
import fu.swp.dorm_mnm.model.Guard;
import fu.swp.dorm_mnm.model.Manager;
import fu.swp.dorm_mnm.model.News;
import fu.swp.dorm_mnm.model.Role;
import fu.swp.dorm_mnm.model.Student;
import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.repository.base.GuardRepository;
import fu.swp.dorm_mnm.repository.base.ManagerRepository;
import fu.swp.dorm_mnm.repository.base.RoleRepository;
import fu.swp.dorm_mnm.repository.base.StudentRepository;
import fu.swp.dorm_mnm.repository.base.UserRepository;
import fu.swp.dorm_mnm.security.service.AuthenticationService;
import fu.swp.dorm_mnm.service.base.UserService;
import fu.swp.dorm_mnm.util.FileUtil;

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

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private AuthenticationService authenticationService;

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

    @Transactional
    @Override
    public UserDto save(MultipartFile userImage, UserDto userDto) {

        Boolean isUserExist = userRepository.existsByUsername(userDto.getUsername());
        Boolean isRoleExist = userDto.getRoleId() != null ? roleRepository.existsById(userDto.getRoleId()) : false;

        UserDto resp = new UserDto();

        if (isUserExist) {
            resp.setMessage("Username: " + userDto.getUsername() + " existed !");
            return resp;
        }
        if (!isRoleExist) {
            resp.setMessage("Role: " + userDto.getRoleId() + " not existed !");
            return resp;
        }

        if (!isUserExist && isRoleExist) {
            LocalDateTime now = LocalDateTime.now();
            Timestamp sqlNow = Timestamp.valueOf(now);

            Role role = roleRepository.findById(userDto.getRoleId()).get();

            User user = new User();
            user.setCreatedAt(sqlNow);
            user.setUpdatedAt(sqlNow);
            user.setUsername(userDto.getUsername());
            user.setEmail(userDto.getEmail());
            user.setAddress(userDto.getAddress());
            user.setGender(userDto.getGender());
            user.setPassword(authenticationService.generate());
            // user.setDateOfBirth(sqlNow);
            user.setPhone(userDto.getPhone());
            user.setStatus("active");
            user.setFullName(userDto.getFullName());
            user.setRole(role);

            // image
            try {
                user.setFileName(userImage.getOriginalFilename());
                user.setFileType(userImage.getContentType());
                user.setFileData(fu.swp.dorm_mnm.util.FileUtil.compressImage(userImage.getBytes()));
            } catch (Exception e) {

            }

            // create student
            if (role.getName().toUpperCase().equalsIgnoreCase("STUDENT")) {

                StudentDto stdto = userDto.getStudentDto();
                Student st = new Student();
                st.setRollNumber(stdto.getRollNumber());
                st.setCreatedAt(sqlNow);
                st.setUpdatedAt(sqlNow);
                st.setParentName(stdto.getParentName());
                st.setUser(user);

                resp = new UserDto(userRepository.save(user));
                resp.setStudentDto(new StudentDto(studentRepository.save(st)));
                resp.setMessage("STUDENT CREATED !");
                authenticationService.forgetPassword(new ForgetPasswordDto(user.getUsername(), user.getEmail()));
                return resp;
            }

            // create admin
            if (role.getName().toUpperCase().equalsIgnoreCase("ADMIN")) {
                resp = new UserDto(userRepository.save(user));
                resp.setMessage("ADMIN CREATED !");
                authenticationService.forgetPassword(new ForgetPasswordDto(user.getUsername(), user.getEmail()));
                return resp;
            }

            // create manager
            if (role.getName().toUpperCase().equalsIgnoreCase("MANAGER")) {

                ManagerDto mdto = userDto.getManagerDto();
                Manager m = new Manager();
                m.setDescription((mdto.getDescription()));
                m.setCreatedAt(sqlNow);
                m.setUpdatedAt(sqlNow);
                m.setUser(user);

                resp = new UserDto(userRepository.save(user));
                resp.setManagerDto(new ManagerDto(managerRepository.save(m)));
                resp.setMessage("MANAGER CREATED !");
                authenticationService.forgetPassword(new ForgetPasswordDto(user.getUsername(), user.getEmail()));
                return resp;
            }

            // create guard
            if (role.getName().toUpperCase().equalsIgnoreCase("GUARD")) {

                GuardDto gdto = userDto.getGuardDto();
                Guard g = new Guard();
                g.setCreatedAt(sqlNow);
                g.setUpdatedAt(sqlNow);
                g.setUser(user);

                resp = new UserDto(userRepository.save(user));
                resp.setGuardDto(new GuardDto(guardRepository.save(g)));
                resp.setMessage("GUARD CREATED !");
                authenticationService.forgetPassword(new ForgetPasswordDto(user.getUsername(), user.getEmail()));
                return resp;
            }

        }

        return null;

    }

    @Override
    public byte[] getUserImage(Long userId) {
        Optional<User> user = userRepository.findById(userId);
        byte[] fileData = FileUtil.decompressImage(user.get().getFileData());
        return fileData;
    }



}
