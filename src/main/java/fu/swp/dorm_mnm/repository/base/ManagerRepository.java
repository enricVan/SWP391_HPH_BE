package fu.swp.dorm_mnm.repository.base;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fu.swp.dorm_mnm.model.Manager;

@Repository
public interface ManagerRepository extends JpaRepository<Manager, Long> {

}
