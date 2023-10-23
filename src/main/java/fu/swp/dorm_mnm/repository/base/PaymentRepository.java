package fu.swp.dorm_mnm.repository.base;

import fu.swp.dorm_mnm.model.Payment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Long> {
    Page<Payment> findByStudentStudentId(Long studentId, Pageable pageable);
}
