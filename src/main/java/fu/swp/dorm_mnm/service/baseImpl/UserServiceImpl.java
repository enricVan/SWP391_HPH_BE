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

import fu.swp.dorm_mnm.dto.base.UserDto;
import fu.swp.dorm_mnm.model.Role;
import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.repository.base.RoleRepository;
import fu.swp.dorm_mnm.repository.base.UserRepository;
import fu.swp.dorm_mnm.service.base.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

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

    @Override
    public UserDto createUser(UserDto userDto) {

        Optional<Role> roleOptional = roleRepository.findById(userDto.getRoleId());

        if (userDto.getUsername().isEmpty() || userDto.getPassword().isEmpty() || !roleOptional.isPresent())
            return null;
        else {

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

            return new UserDto(userRepository.save(user));
        }

    }

}
