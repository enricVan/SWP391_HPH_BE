package fu.swp.dorm_mnm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;


import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.repository.UserRepository;
import fu.swp.dorm_mnm.exception.ResourceNotFoundException;

@CrossOrigin(origins = "http://localhost:5173")
@RestController
//Permits ADMIN
@PreAuthorize("hasAnyRole('ADMIN','STUDENT')")
@RequestMapping("/api/v1/admin/user")
public class UserController {
    @Autowired
    private UserRepository userRepository;

    // get all employees
    @GetMapping
    public List<User> getAllUser() {
        return userRepository.findAll();
    }

	//get User by username
	@GetMapping("/search")
	public ResponseEntity<List<User>> searchUsers(@RequestParam("partialUsername") String partialUsername) {
		return new ResponseEntity<>(userRepository.findByUsernameContaining(partialUsername), HttpStatus.OK);
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
