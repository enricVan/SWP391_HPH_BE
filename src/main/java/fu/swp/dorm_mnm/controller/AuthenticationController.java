package fu.swp.dorm_mnm.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import fu.swp.dorm_mnm.model.Role;
import fu.swp.dorm_mnm.repository.RoleRepository;
import fu.swp.dorm_mnm.security.auth.AuthenticationRequest;
import fu.swp.dorm_mnm.security.auth.AuthenticationResponse;
import fu.swp.dorm_mnm.security.auth.RegisterRequest;
import fu.swp.dorm_mnm.security.service.AuthenticationService;
import fu.swp.dorm_mnm.service.UserService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthenticationController {

    @Autowired
    private final AuthenticationService authenticationService;

    @Autowired
    private final UserService userService;

    @Autowired
    private final RoleRepository roleRepository;

    @PostMapping("/register")
    public ResponseEntity<AuthenticationResponse> register(
            @RequestBody RegisterRequest request) {
        return ResponseEntity.ok(authenticationService.register(request));
    }

    @PostMapping("/authenticate")
    public ResponseEntity<AuthenticationResponse> authenticate(
            @RequestBody AuthenticationRequest authenticationRequest) {
        AuthenticationResponse response = authenticationService.authenticate(authenticationRequest);
  
        return ResponseEntity.ok(response);
    }

    @PostMapping("/refresh-token")
    public void refreshToken(
            HttpServletRequest request,
            HttpServletResponse response) throws IOException {
        authenticationService.refreshToken(request, response);
    }

    @PostMapping("/addRole")
    public ResponseEntity<List<Role>> addRole() {
        List<Role> roles = new ArrayList<>();
        Role admin = new Role();
        admin.setName("ADMIN");
        roles.add(admin);
        roleRepository.save(admin);

        Role student = new Role();
        student.setName("STUDENT");
        roles.add(student);
        roleRepository.save(student);

        Role manager = new Role();
        manager.setName("MANAGER");
        roles.add(manager);
        roleRepository.save(manager);

        return ResponseEntity.ok().body(roles);
    }

    @PostMapping("/addUser")
    public ResponseEntity<List<RegisterRequest>> addUser() {
        List<RegisterRequest> registerRequests = new ArrayList<>();
        RegisterRequest registerRequestAdmin = new RegisterRequest("admin", "admin", "ADMIN");
        RegisterRequest registerRequestStudent = new RegisterRequest("student", "student", "STUDENT");
        RegisterRequest registerRequestManager = new RegisterRequest("manager", "manager", "MANAGER");
        authenticationService.register(registerRequestAdmin);
        authenticationService.register(registerRequestStudent);
        authenticationService.register(registerRequestManager);
        registerRequests.add(registerRequestAdmin);
        registerRequests.add(registerRequestStudent);
        registerRequests.add(registerRequestManager);
        return ResponseEntity.ok().body(registerRequests);
    }

}
