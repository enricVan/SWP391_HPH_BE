package fu.swp.dorm_mnm.service.baseImpl;

import fu.swp.dorm_mnm.dto.base.StudentDto;
import fu.swp.dorm_mnm.model.Student;
import fu.swp.dorm_mnm.repository.base.StudentRepository;
import fu.swp.dorm_mnm.service.base.StudentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentRepository studentRepository;

    @Override
    public Iterable<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public Optional<Student> findById(Long id) {
        return studentRepository.findById(id);
    }

    @Override
    public Optional<Student> findByUserId(Long id) {
        return studentRepository.findByUserId(id);
    }

    @Override
    public Student save(Student student) {
        return studentRepository.save(student);
    }

    @Override
    public void remove(Long id) {
        studentRepository.deleteById(id);
    }

    @Override
    public StudentDto findByRollNumberDto(String rollNumber) {
        Optional<Student> student = studentRepository.findByRollNumber(rollNumber);
        return student.isPresent() ? new StudentDto(student.get()) : null;
    }

    @Override
    public Student findByRollNumber(String rollNumber) {
        Optional<Student> student = studentRepository.findByRollNumber(rollNumber);
        return student.isPresent() ? student.get() : null;
    }
}
