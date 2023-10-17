package fu.swp.dorm_mnm.repository;

import fu.swp.dorm_mnm.model.BedRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BedRequestRepository extends JpaRepository<BedRequest, Long> {
    @Query(value = "SELECT * FROM bed_request WHERE (:status is null or status = :status)" +
            "AND student_id=:studentId",
            countQuery = "SELECT count(*) FROM bed_request WHERE (:status is null or status = :status)" +
                    "AND student_id=:studentId",
            nativeQuery = true)
    Page<BedRequest> findByLastname(@Param("status") String status,@Param("studentId") Long studentId,
                                    Pageable pageable);

}
