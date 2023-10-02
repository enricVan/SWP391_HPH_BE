package fu.swp.dorm_mnm.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long>{
    @Query(value = "SELECT * FROM role WHERE role_name = :roleName", nativeQuery = true)
    Role findByRoleName(@Param("roleName") String roleName);

    // Role findByRoleName(String roleName);
}
