package fu.swp.dorm_mnm.service.serviceImpl;

import fu.swp.dorm_mnm.model.Bed;
import fu.swp.dorm_mnm.model.BedRequest;
import fu.swp.dorm_mnm.model.Student;
import fu.swp.dorm_mnm.repository.BedRequestRepository;
import fu.swp.dorm_mnm.service.BedRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.time.LocalDateTime;
import java.util.Date;
import java.util.Optional;
@Service
public class BedRequestServiceImpl implements BedRequestService {

    @Autowired
    private BedRequestRepository bedRequestRepository;

    @Autowired
    private BedServiceImpl bedService;

    @Autowired
    private StudentServiceImpl studentService;

    @Override
    public Iterable<BedRequest> findAll() {
        return bedRequestRepository.findAll();
    }

    @Override
    public Optional<BedRequest> findById(Long id) {
        return bedRequestRepository.findById(id);
    }

    @Override
    public BedRequest save(BedRequest bedRequestReq) {
        Optional<Bed> bedOptional = bedService.findById(bedRequestReq.getBed().getBedId());
        Optional<Student> studentOptional = studentService.findById(bedRequestReq.getStudent().getStudentId());

        if (bedOptional.isPresent() && studentOptional.isPresent()) {
            Bed bed = bedOptional.get();
            Student student = studentOptional.get();

            BedRequest bedRequest = new BedRequest();
            bedRequest.setCreatedAt(new Date());
            bedRequest.setUpdatedAt(new Date());
            bedRequest.setBed(bed);
            bedRequest.setStudent(student);
            bedRequest.setStatus("pending");
            bedRequest.setSemesterId(bedRequestReq.getSemesterId());
            return bedRequestRepository.save(bedRequest);
        } else {
            return null;
        }
    }

    @Override
    public void remove(Long id) {
        bedRequestRepository.deleteById(id);
    }
}
