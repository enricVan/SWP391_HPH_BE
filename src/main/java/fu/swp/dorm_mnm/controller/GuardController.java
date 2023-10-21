package fu.swp.dorm_mnm.controller;


import fu.swp.dorm_mnm.model.Guard;
import fu.swp.dorm_mnm.service.GuardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "http://localhost:5173")
// @RequestMapping("/api/v1/guard")
@RequestMapping("/guard")
@PreAuthorize("hasAnyRole('MANAGER', 'GUARD')")
public class GuardController {

    @Autowired
    private GuardService guardService;


    @GetMapping("get-guard-by-userid/{userId}")
    @PreAuthorize("hasAuthority('guard:read')")
    public Guard getGuardByUserId(@PathVariable Integer userId) {
        return guardService.getGuardByUserId(userId);
    }
}
