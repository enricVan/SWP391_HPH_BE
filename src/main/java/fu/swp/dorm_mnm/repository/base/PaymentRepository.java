package fu.swp.dorm_mnm.repository.base;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fu.swp.dorm_mnm.model.Payment;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Long> {
    Page<Payment> findByStudentStudentId(Long studentId, Pageable pageable);

    @Query(value = "SELECT p.* FROM payment p " +
            "WHERE p.`status` LIKE 'pending' " +
            "AND expiration_date < :now ", nativeQuery = true)
    List<Payment> findAllExpiredPayment(@Param("now") Timestamp now);
}
