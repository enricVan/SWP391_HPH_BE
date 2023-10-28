package fu.swp.dorm_mnm.service.baseImpl;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fu.swp.dorm_mnm.dto.PageDto;
import fu.swp.dorm_mnm.dto.base.BedRequestDto;
import fu.swp.dorm_mnm.model.Bed;
import fu.swp.dorm_mnm.model.BedRequest;
import fu.swp.dorm_mnm.model.Semester;
import fu.swp.dorm_mnm.model.Student;
import fu.swp.dorm_mnm.repository.base.BedRequestRepository;
import fu.swp.dorm_mnm.service.base.BedRequestService;
import fu.swp.dorm_mnm.service.base.BedService;
import fu.swp.dorm_mnm.service.base.SemesterService;
import fu.swp.dorm_mnm.service.base.StudentService;

@Service
public class BedRequestServiceImpl implements BedRequestService {

    @Autowired
    private BedRequestRepository bedRequestRepository;

    @Autowired
    private BedService bedService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private SemesterService semesterService;

    @Override
    public Iterable<BedRequest> findAll() {
        return bedRequestRepository.findAll();
    }

    @Override
    public Optional<BedRequest> findById(Long id) {
        return bedRequestRepository.findById(id);
    }

    @Override
    public BedRequestDto save( Long studentId, Long bedId, Long semesterId) {

        LocalDateTime now = LocalDateTime.now();
        Timestamp sqlNow = Timestamp.valueOf(now);

        Optional<Bed> bedOptional = bedService.findById(bedId);
        Optional<Student> studentOptional = studentService.findById(studentId);
        Optional<Semester> semesterOptional = semesterService.findById(semesterId);

        if (bedOptional.isPresent() && studentOptional.isPresent() && semesterOptional.isPresent()) {
            Bed bed = bedOptional.get();
            Student student = studentOptional.get();
            Semester semester = semesterOptional.get();

            BedRequest bedRequest = new BedRequest();
            bedRequest.setCreatedAt(sqlNow);
            bedRequest.setUpdatedAt(sqlNow);
            bedRequest.setBed(bed);
            bedRequest.setStudent(student);
            bedRequest.setStatus("Pending");
            bedRequest.setSemester(semester);
            return new BedRequestDto( bedRequestRepository.save(bedRequest));
        } else {
            return null;
        }
    }

    @Override
    public BedRequest save(BedRequest bedRequestReq) {

        LocalDateTime now = LocalDateTime.now();
        Timestamp sqlNow = Timestamp.valueOf(now);

        Optional<Bed> bedOptional = bedService.findById(bedRequestReq.getBed().getBedId());
        Optional<Student> studentOptional = studentService.findByUserId(bedOptional.get().getStudent().getStudentId());

        if (bedOptional.isPresent() && studentOptional.isPresent()) {
            Bed bed = bedOptional.get();
            Student student = studentOptional.get();

            BedRequest bedRequest = new BedRequest();
            bedRequest.setCreatedAt(sqlNow);
            bedRequest.setUpdatedAt(sqlNow);
            bedRequest.setBed(bed);
            bedRequest.setStudent(student);
            bedRequest.setStatus("Pending");
            bedRequest.setSemester(bedRequestReq.getSemester());
            return bedRequestRepository.save(bedRequest);
        } else {
            return null;
        }
    }

    @Override
    public void remove(Long id) {
        bedRequestRepository.deleteById(id);
    }

    @Override
    public PageDto<BedRequestDto> findByUserId(String status, Long userId, Pageable pageable) {
        Optional<Student> studentOptional = studentService.findByUserId(userId);
        Student student = new Student();
        if (studentOptional.isPresent()) {
            student = studentOptional.get();
        }
        System.out.println(student.getStudentId());
        Page<BedRequest> page = bedRequestRepository.listBedRequest(status, student.getStudentId(), pageable);
        List<BedRequest> bedRequestList = page.getContent();
        List<BedRequestDto> bedRequestDtoList = new ArrayList<>();
        for (BedRequest bedRequest : bedRequestList) {
            bedRequestDtoList.add(new BedRequestDto(bedRequest));
        }
        PageDto<BedRequestDto> pageDto = new PageDto<>();
        pageDto.setData(bedRequestDtoList);
        pageDto.setCurrentPage(page.getNumber());
        pageDto.setTotalPages(page.getTotalPages());
        pageDto.setTotalItems(page.getTotalElements());
        return pageDto;
    }
}
