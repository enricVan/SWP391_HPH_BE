package fu.swp.dorm_mnm.controller.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import fu.swp.dorm_mnm.model.Role;
import fu.swp.dorm_mnm.repository.base.RoleRepository;

@RestController
@RequestMapping("/admin")
public class RoleController {

    @Autowired
    private RoleRepository roleRepository;

    @PostMapping("/role")
    public Role createRole(@RequestBody Role role) {
        return roleRepository.save(role);
    }
}
