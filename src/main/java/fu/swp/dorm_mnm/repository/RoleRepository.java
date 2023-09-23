package fu.swp.dorm_mnm.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fu.swp.dorm_mnm.model.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long>{
    Role findByRoleName(String roleName);
}
