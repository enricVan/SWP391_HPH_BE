package fu.swp.dorm_mnm.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.repository.UserRepository;

@RestController
@RequestMapping("/api/v1/health-check")
public class HealthCheckController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping
    public ResponseEntity<HashMap<String, String>> healthCheck() {
        HashMap<String, String> response = new HashMap<>();
        response.put("status", "unhealthy");
        try {
            List<User> users = userRepository.findAll();
            response.clear();
            response.put("1st user from db", users.get(0).getFullName());
            response.put("status", "healthy");
        } catch (Exception error) {
            response.clear();
            response.put("status", "unhealthy");
            response.put("error", error + "");
        }
        return ResponseEntity.ok(response);
    }
}