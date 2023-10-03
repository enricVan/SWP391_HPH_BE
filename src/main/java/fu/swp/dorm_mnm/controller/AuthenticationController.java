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
import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.model.auth.AuthenticationRequest;
import fu.swp.dorm_mnm.model.auth.AuthenticationResponse;
import fu.swp.dorm_mnm.model.auth.RegisterRequest;
import fu.swp.dorm_mnm.repository.RoleRepository;
import fu.swp.dorm_mnm.service.auth.AuthenticationService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthenticationController {

  private final AuthenticationService service;

  @Autowired
  private final RoleRepository roleRepository;

  @PostMapping("/register")
  public ResponseEntity<AuthenticationResponse> register(
      @RequestBody RegisterRequest request) {
    return ResponseEntity.ok(service.register(request));
  }

  @PostMapping("/authenticate")
  public ResponseEntity<AuthenticationResponse> authenticate(
      @RequestBody AuthenticationRequest request) {
    return ResponseEntity.ok(service.authenticate(request));
  }

  @PostMapping("/refresh-token")
  public void refreshToken(
      HttpServletRequest request,
      HttpServletResponse response) throws IOException {
    service.refreshToken(request, response);
  }

  @PostMapping("/addRole")
  public ResponseEntity<List<Role>> addRole() {
    List<Role> roles = new ArrayList<>();
    Role admin = new Role();
    admin.setName("ADMIN");
    roles.add(admin);

    Role student = new Role();
    student.setName("STUDENT");
    roles.add(student);

    Role manager = new Role();
    manager.setName("MANAGER");
    roles.add(manager);

    return ResponseEntity.ok().body(roles);
  }

  @PostMapping("/addUser")
  public ResponseEntity<List<RegisterRequest>> addUser() {
    List<RegisterRequest> registerRequests = new ArrayList<>();
    RegisterRequest registerRequestAdmin = new RegisterRequest("admin", "admin", "ADMIN");
    RegisterRequest registerRequestStudent = new RegisterRequest("student", "student", "STUDENT");
    RegisterRequest registerRequestManager = new RegisterRequest("manager", "manager", "MANAGER");
    registerRequests.add(registerRequestAdmin);
    registerRequests.add(registerRequestStudent);
    registerRequests.add(registerRequestManager);
    return ResponseEntity.ok().body(registerRequests);
  }

}
