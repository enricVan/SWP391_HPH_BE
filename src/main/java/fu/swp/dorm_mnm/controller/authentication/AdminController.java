package fu.swp.dorm_mnm.controller.authentication;

import org.springframework.beans.factory.annotation.Autowired;
// import io.swagger.v3.oas.annotations.Hidden;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.repository.base.UserRepository;

@RestController
// @RequestMapping("/api/v1/admin")
@RequestMapping("/admin")
// @PreAuthorize("hasRole('ADMIN')") //mac dinh + ROLE_ de thanh ROLE_ADMIN
public class AdminController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping
    @PreAuthorize("hasAuthority('admin:read')") //lay nguyen k them
    public String get() {
        String out = "";
        Iterable<User> users = userRepository.findAll();
        for(User user: users){
            out = user.getUsername();
        }
        return out;
    }
    @PostMapping
    @PreAuthorize("hasAuthority('admin:create')")
    //@Hidden
    public String post() {
        return "POST:: admin controller";
    }
    @PutMapping
    @PreAuthorize("hasAuthority('admin:update')")
    //@Hidden
    public String put() {
        return "PUT:: admin controller";
    }
    @DeleteMapping
    @PreAuthorize("hasAuthority('admin:delete')")
    //@Hidden
    public String delete() {
        return "DELETE:: admin controller";
    }
}
