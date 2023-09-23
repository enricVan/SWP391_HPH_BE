package fu.swp.dorm_mnm.service;


import java.util.Optional;


import fu.swp.dorm_mnm.model.Role;

public interface RoleService {

    public Iterable<Role> findAll();

    public Optional<Role> findById(Long id);

    public Role save(Role bed);

    public void remove(Long id);
}
