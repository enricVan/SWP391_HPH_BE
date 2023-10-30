package fu.swp.dorm_mnm.service.base;

import fu.swp.dorm_mnm.dto.PageDto;
import fu.swp.dorm_mnm.dto.base.PaymentDto;
import fu.swp.dorm_mnm.model.Payment;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

public interface PaymentService {

    public Iterable<Payment> findAll();

    public Optional<Payment> findById(Long id);

    public Payment save(Payment payment);

    public void remove(Long id);

    public PageDto<PaymentDto> findByUserId(Long userId, Pageable pageable);

    public Payment checkPaymentBedRequest(Long id, Long managerId);

    public Payment unCheckPaymentBedRequest(Long id, Long managerId);
}
