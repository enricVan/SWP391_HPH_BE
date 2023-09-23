package fu.swp.dorm_mnm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import fu.swp.dorm_mnm.model.Student;
import fu.swp.dorm_mnm.repository.StudentRepository;

@Controller
@RequestMapping("/api/v1/admin/student")
public class StudentController {
    @Autowired
    private StudentRepository studentRepository;

    @PostMapping
    public ResponseEntity<Student> createNewStudent(@RequestBody Student studentRequest) {
        return new ResponseEntity<>(studentRepository.save(studentRequest), HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<Iterable<Student>> getAllStudent() {
        return new ResponseEntity<>(studentRepository.findAll(), HttpStatus.OK);
    }
}
