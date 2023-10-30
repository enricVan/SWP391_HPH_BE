package fu.swp.dorm_mnm.service.base;

import fu.swp.dorm_mnm.dto.PageDto;
import fu.swp.dorm_mnm.dto.base.PaymentDto;
import fu.swp.dorm_mnm.model.Payment;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

public interface PaymentService {

    Iterable<Payment> findAll();

    Optional<Payment> findById(Long id);

    Payment save(Payment payment);

    void remove(Long id);

    PageDto<PaymentDto> findByUserId(Long userId, Pageable pageable);

    Payment checkPaymentBedRequest(Long id, Long managerId);
}
