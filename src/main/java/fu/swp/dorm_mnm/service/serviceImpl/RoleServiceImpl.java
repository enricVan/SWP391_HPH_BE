package fu.swp.dorm_mnm.service.serviceImpl;

import fu.swp.dorm_mnm.model.Role;
import fu.swp.dorm_mnm.repository.RoleRepository;
import fu.swp.dorm_mnm.service.RoleService;

import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public Iterable<Role> findAll() {
        return roleRepository.findAll();
    }

    @Override
    public Optional<Role> findById(Long id) {
        return roleRepository.findById(id);
    }

    @Override
    public Role save(Role bed) {
        return roleRepository.save(bed);
    }

    @Override
    public void remove(Long id) {
        roleRepository.deleteById(id);
    }
}
