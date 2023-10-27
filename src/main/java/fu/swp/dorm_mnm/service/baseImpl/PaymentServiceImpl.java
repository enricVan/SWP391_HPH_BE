package fu.swp.dorm_mnm.service.baseImpl;

import fu.swp.dorm_mnm.dto.PageDto;
import fu.swp.dorm_mnm.dto.base.PaymentDto;
import fu.swp.dorm_mnm.model.Payment;
import fu.swp.dorm_mnm.model.Student;
import fu.swp.dorm_mnm.repository.base.PaymentRepository;
import fu.swp.dorm_mnm.service.base.PaymentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class PaymentServiceImpl implements PaymentService {
    @Autowired
    private StudentServiceImpl studentService;
    @Autowired
    PaymentRepository paymentRepository;
    @Override
    public Iterable<Payment> findAll() {
        return null;
    }

    @Override
    public Optional<Payment> findById(Long id) {
        return Optional.empty();
    }

    @Override
    public Payment save(Payment payment) {
        return null;
    }

    @Override
    public void remove(Long id) {

    }

    @Override
    public PageDto<PaymentDto> findByUserId(Long userId, Pageable pageable) {
        Optional<Student> studentOptional = studentService.findByUserId(userId);
        Student student=new Student();
        if(studentOptional.isPresent()){
            student=studentOptional.get();
        }
        Page<Payment> page=paymentRepository.findByStudentStudentId(student.getStudentId(),pageable);
        List<PaymentDto> paymentDtoList=new ArrayList<>();
        for(Payment payment:page.getContent()){
            paymentDtoList.add(new PaymentDto(payment));
        }
        PageDto<PaymentDto> pageDto=new PageDto<>();
        pageDto.setData(paymentDtoList);
        pageDto.setTotalPages(page.getTotalPages());
        pageDto.setTotalItems(page.getTotalElements());
        pageDto.setCurrentPage(page.getNumber());
        return pageDto;
    }
}
