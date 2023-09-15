package fu.swp.dorm_mnm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fu.swp.dorm_mnm.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{

}
