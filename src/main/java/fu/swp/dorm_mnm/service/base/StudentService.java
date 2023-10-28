package fu.swp.dorm_mnm.service.base;

import java.util.Optional;

import fu.swp.dorm_mnm.model.Student;

public interface StudentService {

    public Iterable<Student> findAll();

    public Optional<Student> findById(Long id);

    public Student save(Student student);

    public void remove(Long id);

    public Optional<Student> findByUserId(Long id);
}
