package fu.swp.dorm_mnm.service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import fu.swp.dorm_mnm.model.AuthenticationRequest;
import fu.swp.dorm_mnm.model.AuthenticationResponse;
import fu.swp.dorm_mnm.model.ChangePasswordRequest;
import fu.swp.dorm_mnm.model.RegisterRequest;
import fu.swp.dorm_mnm.model.Role;
import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.repository.RoleRepository;
import fu.swp.dorm_mnm.repository.UserRepository;
import fu.swp.dorm_mnm.security.JwtService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AuthenticationService {

        private final UserRepository userRepository;

        private final RoleRepository roleRepository;

        private final PasswordEncoder passwordEncoder;

        private final AuthenticationManager authenticationManager;

        @Autowired
        private EmailService emailService;

        @Autowired
        private JwtService jwtService;

        public AuthenticationResponse authenticate(AuthenticationRequest request) {
                authenticationManager.authenticate(
                                new UsernamePasswordAuthenticationToken(
                                                request.getUsername(),
                                                request.getPassword()));
                var user = userRepository.findByUsername(request.getUsername())
                                .orElseThrow();

                var jwtToken = jwtService.generateToken(user);

                return AuthenticationResponse.builder()
                                .token(jwtToken)
                                .role(user.getRole().getRoleName())
                                .build();
        }

        public AuthenticationResponse register(RegisterRequest request) {
                Role role = roleRepository.findByRoleName("STUDENT");

                var user = User.builder()
                                .username(request.getUsername())
                                .password(passwordEncoder.encode(request.getPassword()))
                                .role(role)
                                .build();
                userRepository.save(user);
                var jwtToken = jwtService.generateToken(user);

                return AuthenticationResponse.builder()
                                .token(jwtToken)
                                .role(role.getRoleName())
                                .build();
        }

        public boolean changePassword(ChangePasswordRequest request) {
                User user = userRepository.findByUsername(request.getUsername()).get();
                if (passwordEncoder.matches(request.getOldPassword(), user.getPassword())) {
                        user.setPassword(passwordEncoder.encode(request.getNewPassword()));
                        userRepository.save(user);
                        return true;
                }
                return false;
        }

        public boolean forgetPassword(User request) {
                User user = userRepository.findByUsername(request.getUsername()).get();
                if (!request.getEmail().equals(user.getEmail()))
                        return false;
                UUID uuid = UUID.randomUUID();
                String newPass = uuid.toString().replace("-", "");
                String from = "nguyenquangloi2704@gmail.com";
                String to = "loinq2704@gmail.com";
                String subject = "Reset Password";
                String text = "Your new password is: " + newPass;
                user.setPassword(passwordEncoder.encode(newPass));
                emailService.sendSimpleMessage(from, to, subject, text);
                userRepository.save(user);
                return true;
        }

}