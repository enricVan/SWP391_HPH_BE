package fu.swp.dorm_mnm.service;

import fu.swp.dorm_mnm.model.Bed;
import fu.swp.dorm_mnm.model.Semester;
import fu.swp.dorm_mnm.model.Student;

import java.util.Optional;

public interface StudentService {
    
    Iterable<Student> findAll();

    Optional<Student> findById(Long id);

    Student save(Student student);

    void remove(Long id);
}
