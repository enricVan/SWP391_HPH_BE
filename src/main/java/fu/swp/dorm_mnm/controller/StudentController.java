package fu.swp.dorm_mnm.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fu.swp.dorm_mnm.model.Student;
import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.repository.StudentRepository;
import fu.swp.dorm_mnm.repository.UserRepository;

@Controller
@RequestMapping("/api/v1/admin/student")
public class StudentController {
    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private UserRepository userRepository;

    @PutMapping
    public ResponseEntity<User> createNewStudent(@RequestBody User studentRequest) {
        User user = userRepository.findByUsername(studentRequest.getUsername()).get();
        user.setFullName(studentRequest.getFullName());
        user.setDateOfBirth(studentRequest.getDateOfBirth());
        user.setGender(studentRequest.getGender());
        user.setEmail(studentRequest.getEmail());
        Date date = new Date();
        if(user.getCreatedAt()==null){
            user.setCreatedAt(date);
        }else{
            user.setUpdatedAt(date);
        }
        return new ResponseEntity<>(userRepository.save(user), HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<Iterable<Student>> getAllStudent() {
        return new ResponseEntity<>(studentRepository.findAll(), HttpStatus.OK);
    }
}
