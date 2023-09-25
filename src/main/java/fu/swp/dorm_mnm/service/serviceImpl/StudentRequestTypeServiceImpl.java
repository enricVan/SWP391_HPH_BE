package fu.swp.dorm_mnm.service.serviceImpl;

import fu.swp.dorm_mnm.model.StudentRequestType;
import fu.swp.dorm_mnm.repository.StudentRequestTypeRepository;
import fu.swp.dorm_mnm.service.StudentRequestTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
@Service
public class StudentRequestTypeServiceImpl implements StudentRequestTypeService {

    @Autowired
    private StudentRequestTypeRepository studentRequestTypeRepository;
    @Override
    public Iterable<StudentRequestType> findAll() {
        return studentRequestTypeRepository.findAll();
    }

    @Override
    public Optional<StudentRequestType> findById(Long id) {
        return studentRequestTypeRepository.findById(id);
    }

    @Override
    public StudentRequestType save(StudentRequestType studentRequestType) {
        return studentRequestTypeRepository.save(studentRequestType);
    }

    @Override
    public void remove(Long id) {
        studentRequestTypeRepository.deleteById(id);
    }
}
