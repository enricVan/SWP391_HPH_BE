package fu.swp.dorm_mnm.repository.base;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fu.swp.dorm_mnm.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    @Query(value = "SELECT u.* FROM `user` u " +
            "JOIN `role` r " +
            "ON u.role_id = r.role_id " +
            "WHERE r.role_id= :roleId ", nativeQuery = true)
    public List<User> getUserByRole(@Param("roleId") Long roleId);

    Optional<User> findByUsername(String username);

    Optional<User> findByEmail(String email);

    Page<User> findByUsernameContaining(String partialUsername, Pageable pageable);

}
