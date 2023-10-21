package fu.swp.dorm_mnm.controller;

import fu.swp.dorm_mnm.model.Role;
import fu.swp.dorm_mnm.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "http://localhost:5173")
@RestController
// @RequestMapping("/api/v1/admin")
@RequestMapping("/admin")
public class RoleController {

    @Autowired
    private RoleRepository roleRepository;

    @PostMapping("/role")
    public Role createRole(@RequestBody Role role) {
        return roleRepository.save(role);
    }
}
