package fu.swp.dorm_mnm.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fu.swp.dorm_mnm.model.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long>{
    @Query(value = "SELECT * FROM role WHERE role_name = :roleName", nativeQuery = true)
    Role findByRoleName(String roleName);
}
