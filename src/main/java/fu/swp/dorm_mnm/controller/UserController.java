package fu.swp.dorm_mnm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.repository.UserRepository;
import fu.swp.dorm_mnm.exception.ResourceNotFoundException;

@CrossOrigin(origins = "http://localhost:5173")
@RestController
//Permits ADMIN
@PreAuthorize("hasRole('ADMIN')")
@RequestMapping("/api/v1/user")
public class UserController {
    @Autowired
    private UserRepository userRepository;

    // get all employees
    @GetMapping
    public List<User> getAllUser() {
        return userRepository.findAll();
    }

    // create employee rest api
    @PostMapping
    public User createUser(@RequestBody User user) {
        return userRepository.save(user);
    }

    // get employee by id rest api
    @GetMapping("/{id}")
    public ResponseEntity<User> getUserById(@PathVariable Integer id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User not exist with id :" +
                        id));
        return ResponseEntity.ok(user);
    }

    // update employee rest api

    @PutMapping("/{id}")
    public ResponseEntity<User> updateEmployee(@PathVariable Integer id, @RequestBody User userDetails) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User not exist with id :" + id));

        user.setFullName(userDetails.getFullName());
        user.setUsername(userDetails.getUsername());
        user.setPassword(userDetails.getPassword());

        User updatedUser = userRepository.save(user);
        return ResponseEntity.ok(updatedUser);
    }

    // delete employee rest api
    @DeleteMapping("/{id}")
    public ResponseEntity<Map<String, Boolean>> deleteUser(@PathVariable Integer id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User not exist with id :" + id));

        userRepository.delete(user);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", Boolean.TRUE);
        return ResponseEntity.ok(response);
    }
}
