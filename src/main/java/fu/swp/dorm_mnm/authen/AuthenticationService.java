package fu.swp.dorm_mnm.authen;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import fu.swp.dorm_mnm.config.JwtService;
import fu.swp.dorm_mnm.model.Role;
import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.repository.UserRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AuthenticationService {

    private final UserRepository repository;

    private final PasswordEncoder passwordEncoder;

    private final AuthenticationManager authenticationManager;

    private JwtService jwtService;

    public AuthenticationResponse authenticate(AuthenticationRequest request) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getUsername(),
                        request.getPassword()));
        var user = repository.findByUsername(request.getUsername())
                .orElseThrow();

        var jwtToken = jwtService.generateToken(user);

        return AuthenticationResponse.builder()
        .token(jwtToken)
        .build();
    }

    public AuthenticationResponse register(RegisterRequest request) {
        var user = User.builder()
        .username(request.getUsername())
        .password(passwordEncoder.encode(request.getPassword()))
        .role(Role.ADMIN)
        .build();
        repository.save(user);
        var jwtToken = jwtService.generateToken(user);

        return AuthenticationResponse.builder()
        .token(jwtToken)
        .build();
    }

}
