package fu.swp.dorm_mnm.controller.base;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import fu.swp.dorm_mnm.model.Student;
import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.repository.base.StudentRepository;
import fu.swp.dorm_mnm.repository.base.UserRepository;

@RestController
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private UserRepository userRepository;

    @PutMapping
    @PreAuthorize("hasAuthority('student:update')")
    public ResponseEntity<User> createNewStudent(@RequestBody User studentRequest) {
        User user = userRepository.findByUsername(studentRequest.getUsername()).get();
        user.setFullName(studentRequest.getFullName());
        user.setDateOfBirth(studentRequest.getDateOfBirth());
        user.setGender(studentRequest.getGender());
        user.setEmail(studentRequest.getEmail());
        Date date = new Date();
        if (user.getCreatedAt() == null) {
            user.setCreatedAt(date);
        } else {
            user.setUpdatedAt(date);
        }
        return new ResponseEntity<>(userRepository.save(user), HttpStatus.OK);
    }

    @GetMapping
    @PreAuthorize("hasAuthority('student:read')")
    public ResponseEntity<Iterable<Student>> getAllStudent() {
        return new ResponseEntity<>(studentRepository.findAll(), HttpStatus.OK);
    }
}