package fu.swp.dorm_mnm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.repository.UserRepository;
import fu.swp.dorm_mnm.exception.ResourceNotFoundException;

@CrossOrigin(origins = "http://localhost:5173")
@RestController

@RequestMapping("/api/v1/")
public class UserController {
	@Autowired
	private UserRepository userRepository;

	// get all employees
	@GetMapping("/user")
	public List<User> getAllUser() {
		return userRepository.findAll();
	}

	//get User by username
	@GetMapping("/user/search")
	public ResponseEntity<List<User>> searchUsers(@RequestParam("partialUsername") String partialUsername) {
		return new ResponseEntity<>(userRepository.findByUsernameContaining(partialUsername), HttpStatus.OK);
	}

	// create employee rest api
	@PostMapping("/user")
	public User createUser(@RequestBody User user) {
		return userRepository.save(user);
	}

	// get employee by id rest api
	@GetMapping("/user/{id}")
	public ResponseEntity<User> getUserById(@PathVariable Long id) {
		User user = userRepository.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("User not exist with id :" +
						id));
		return ResponseEntity.ok(user);
	}

	// update employee rest api

	@PutMapping("/user/{id}")
	public ResponseEntity<User> updateEmployee(@PathVariable Long id, @RequestBody User userDetails) {
		User user = userRepository.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("User not exist with id :" + id));

		user.setFullName(userDetails.getFullName());
		user.setUsername(userDetails.getUsername());
		user.setPassword(userDetails.getPassword());

		User updatedUser = userRepository.save(user);
		return ResponseEntity.ok(updatedUser);
	}

	// delete employee rest api
	@DeleteMapping("/user/{id}")
	public ResponseEntity<Map<String, Boolean>> deleteUser(@PathVariable Long id) {
		User user = userRepository.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("User not exist with id :" + id));

		userRepository.delete(user);
		Map<String, Boolean> response = new HashMap<>();
		response.put("deleted", Boolean.TRUE);
		return ResponseEntity.ok(response);
	}
}
