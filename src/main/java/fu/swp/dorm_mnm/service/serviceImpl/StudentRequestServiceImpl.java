package fu.swp.dorm_mnm.service.serviceImpl;


import fu.swp.dorm_mnm.model.BedRequest;
import fu.swp.dorm_mnm.model.Student;
import fu.swp.dorm_mnm.model.StudentRequest;
import fu.swp.dorm_mnm.model.StudentRequestType;
import fu.swp.dorm_mnm.repository.StudentRepository;
import fu.swp.dorm_mnm.repository.StudentRequestRepository;
import fu.swp.dorm_mnm.repository.StudentRequestTypeRepository;
import fu.swp.dorm_mnm.service.StudentRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Optional;

@Service
public class StudentRequestServiceImpl implements StudentRequestService {
    @Autowired
    private StudentRequestRepository studentRequestRepository;

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private StudentRequestTypeRepository studentRequestTypeRepository;
    @Override
    public Iterable<StudentRequest> findAll() {
        return studentRequestRepository.findAll();
    }

    @Override
    public Optional<StudentRequest> findById(Long id) {
        return studentRequestRepository.findById(id);
    }

    @Override
    public StudentRequest save(StudentRequest studentRequestReq) {
        Optional<Student> studentOptional = studentRepository.findById(studentRequestReq.getStudent().getStudentId());
        Optional<StudentRequestType> studentRequestTypeOptional = studentRequestTypeRepository.findById(studentRequestReq.getStudentRequestType().getStudentRequestTypeId());

        if (studentOptional.isPresent() && studentRequestTypeOptional.isPresent()) {
            Student student = studentOptional.get();
            StudentRequestType studentRequestType = studentRequestTypeOptional.get();

            StudentRequest studentRequest = new StudentRequest();
            studentRequest.setCreatedAt(new Date());
            studentRequest.setUpdatedAt(new Date());
            studentRequest.setStudent(student);
            studentRequest.setStatus("pending");
            studentRequest.setStudentRequestType(studentRequestType);
            studentRequest.setRequestContent(studentRequestReq.getRequestContent());

            return studentRequestRepository.save(studentRequest);
        } else {
            return null;
        }
    }

    @Override
    public void remove(Long id) {
        studentRequestRepository.deleteById(id);
    }
}
