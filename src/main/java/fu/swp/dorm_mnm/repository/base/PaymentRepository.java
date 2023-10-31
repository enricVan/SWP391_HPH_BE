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
import fu.swp.dorm_mnm.model.Student;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Long> {

    Page<Payment> findByStudentStudentId(Long studentId, Pageable pageable);

    @Query(value = "SELECT p.* FROM payment p " +
            "WHERE p.`status` LIKE 'pending' " +
            "AND expiration_date < :now ", nativeQuery = true)
    public List<Payment> findAllExpiredPayment(@Param("now") Timestamp now);

    @Query(value = "SELECT p.* FROM payment p \n" +
            "JOIN student s ON s.student_id = p.student_id \n" +
            "WHERE (:rollNumber IS NULL OR :rollNumber = '' OR s.roll_number LIKE :rollNumber) \n" +
            "AND (:status IS NULL OR :status = '' OR p.`status` LIKE :status);", countQuery = "SELECT COUNT(*) FROM payment p \n"
                    +
                    "JOIN student s ON s.student_id = p.student_id \n" +
                    "WHERE (:rollNumber IS NULL OR :rollNumber = '' OR s.roll_number LIKE :rollNumber) \n" +
                    "AND (:status IS NULL OR :status = '' OR p.`status` LIKE :status)", nativeQuery = true)
    Page<Payment> getAllStudentByFilter(
            @Param("rollNumber") String rollNumber,
            @Param("status") String status,
            Pageable pageable);

}
