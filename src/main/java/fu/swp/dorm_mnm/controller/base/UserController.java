package fu.swp.dorm_mnm.controller.base;

import java.util.*;

import fu.swp.dorm_mnm.model.Guard;
import fu.swp.dorm_mnm.model.News;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.repository.base.UserRepository;
import fu.swp.dorm_mnm.service.base.UserService;
import fu.swp.dorm_mnm.dto.base.UserDto;
import fu.swp.dorm_mnm.exception.ResourceNotFoundException;

// @CrossOrigin(origins = "http://localhost:5173")
@RestController
// @PreAuthorize("hasAnyRole('ADMIN','STUDENT', 'MANAGER', 'GUARD')")
// @RequestMapping("/api/v2/user")
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    // @GetMapping
    // @PreAuthorize("hasAuthority('user:read')")
    // public ResponseEntity<List<UserDto>> getAllUser() {
    // List<User> userList = userRepository.findAll();
    // List<UserDto> userDtos = new ArrayList<>();
    // for (User user : userList) {
    // userDtos.add(new UserDto(user));
    // }
    // return new ResponseEntity<>(userDtos, HttpStatus.OK);
    // }

    // create employee rest api
    @PostMapping
    @PreAuthorize("hasAuthority('user:create')")
    public User createUser(@RequestBody User user) {
        return userRepository.save(user);
    }

    @GetMapping("/userdetails")
    @PreAuthorize("hasAuthority('user:read')")
    public ResponseEntity<UserDto> getUserDetails() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) authentication.getPrincipal();
        UserDto userDto = new UserDto(user);
        return ResponseEntity.ok(userDto);
    }

    // get user by id rest api
    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('user:read')")
    public ResponseEntity<UserDto> getUserById(@PathVariable Integer id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User not exist with id :" +
                        id));
        return new ResponseEntity<>((new UserDto(user)), HttpStatus.OK);
    }

    // update employee rest api

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('user:update')")
    public ResponseEntity<User> updateStatus(@PathVariable Integer id, @RequestBody User userDetails) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User not exist with id :" + id));

        user.setStatus(userDetails.getStatus());
        user.setUpdatedAt(new Date());

        User updatedUser = userRepository.save(user);
        return ResponseEntity.ok(updatedUser);
    }

    // delete employee rest api
    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('user:delete')")
    public ResponseEntity<Map<String, Boolean>> deleteUser(@PathVariable Integer id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User not exist with id :" + id));

        userRepository.delete(user);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", Boolean.TRUE);
        return ResponseEntity.ok(response);
    }

}
