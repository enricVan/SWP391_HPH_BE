package fu.swp.dorm_mnm.repository;

import fu.swp.dorm_mnm.model.BedRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BedRequestRepository extends JpaRepository<BedRequest, Long> {

}
