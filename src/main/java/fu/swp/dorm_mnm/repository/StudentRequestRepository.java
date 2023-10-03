package fu.swp.dorm_mnm.repository;

import fu.swp.dorm_mnm.model.StudentRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentRequestRepository extends JpaRepository<StudentRequest, Long> {
}
