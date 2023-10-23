package fu.swp.dorm_mnm.service.baseImpl;

import fu.swp.dorm_mnm.model.BedRequest;
import fu.swp.dorm_mnm.model.Student;
import fu.swp.dorm_mnm.repository.base.RequestApplicationRepository;
import fu.swp.dorm_mnm.repository.base.RequestApplicationTypeRepository;
import fu.swp.dorm_mnm.repository.base.StudentRepository;
import fu.swp.dorm_mnm.model.RequestApplication;
import fu.swp.dorm_mnm.model.RequestApplicationType;
import fu.swp.dorm_mnm.service.base.RequestApplicationService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Optional;

@Service
public class RequestApplicationServiceImpl implements RequestApplicationService {
    @Autowired
    private RequestApplicationRepository requestApplicationRepository;

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private RequestApplicationTypeRepository requestApplicationTypeRepository;

    @Override
    public Iterable<RequestApplication> findAll() {
        return requestApplicationRepository.findAll();
    }

    @Override
    public Optional<RequestApplication> findById(Long id) {
        return requestApplicationRepository.findById(id);
    }

    @Override
    public RequestApplication save(RequestApplication reqApp) {
        Optional<Student> studentOptional = studentRepository.findById(reqApp.getStudent().getStudentId());
        Optional<RequestApplicationType> requestApplicationTypeOptional = requestApplicationTypeRepository
                .findById(reqApp.getRequestApplicationType().getRequestApplicationTypeId());

        if (studentOptional.isPresent() && requestApplicationTypeOptional.isPresent()) {
            Student student = studentOptional.get();
            RequestApplicationType requestApplicationType = requestApplicationTypeOptional.get();

            RequestApplication requestApplication = new RequestApplication();
            requestApplication.setCreatedAt(new Date());
            requestApplication.setUpdatedAt(new Date());
            requestApplication.setStudent(student);
            requestApplication.setStatus("pending");
            requestApplication.setRequestApplicationType(requestApplicationType);
            requestApplication.setRequestContent(reqApp.getRequestContent());

            return requestApplicationRepository.save(requestApplication);
        } else {
            return null;
        }
    }

    @Override
    public void remove(Long id) {
        requestApplicationRepository.deleteById(id);
    }
}
