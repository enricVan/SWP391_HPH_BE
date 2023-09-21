package fu.swp.dorm_mnm.service;

import fu.swp.dorm_mnm.model.Role;
import fu.swp.dorm_mnm.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public void save(Role role) {
        roleRepository.save(role);
    }
}
