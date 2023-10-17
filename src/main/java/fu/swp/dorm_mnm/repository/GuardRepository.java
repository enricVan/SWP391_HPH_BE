package fu.swp.dorm_mnm.repository;

import fu.swp.dorm_mnm.model.Guard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GuardRepository extends JpaRepository<Guard, Long> {
}
