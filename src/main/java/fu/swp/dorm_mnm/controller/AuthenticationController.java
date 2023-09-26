package fu.swp.dorm_mnm.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import fu.swp.dorm_mnm.exception.ResourceNotFoundException;
import fu.swp.dorm_mnm.model.AuthenticationRequest;
import fu.swp.dorm_mnm.model.AuthenticationResponse;
import fu.swp.dorm_mnm.model.ChangePasswordRequest;
import fu.swp.dorm_mnm.model.RegisterRequest;
import fu.swp.dorm_mnm.service.AuthenticationService;
import lombok.RequiredArgsConstructor;

@CrossOrigin(origins = "http://localhost:5173")
@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthenticationController {

    private final AuthenticationService service;

    @PostMapping("/register")
    public ResponseEntity<AuthenticationResponse> register(
        @RequestBody RegisterRequest request
    ){
        return ResponseEntity.ok(service.register(request));
    }

    @PostMapping("/authenticate")
    public ResponseEntity<AuthenticationResponse> register(
        @RequestBody AuthenticationRequest request
    ){
        return ResponseEntity.ok(service.authenticate(request));
    }

    @PutMapping("/changePassword")
    public ResponseEntity<String> changePassword(
        @RequestBody ChangePasswordRequest request
    ){
        if(!service.changePassword(request)){
            throw new ResourceNotFoundException("Invalid old password");
        }
        return ResponseEntity.ok("ok");
    }
}
