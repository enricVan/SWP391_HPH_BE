package fu.swp.dorm_mnm.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfiguration {

    private final JwtAuthenticationFilter jwtAuthFilter;

    private final AuthenticationProvider authenticationProvider;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{
        http
        .csrf()
        .disable()
        .cors().and()
        .authorizeHttpRequests()
        .antMatchers("/api/v1/**").permitAll() //config that to test all API
//        .antMatchers("/api/v1/auth/**", "/api/v1/public/**").permitAll()
//        .antMatchers("/api/v1/admin/**", "/api/v1/auth/register").hasAuthority("ADMIN")
//        .antMatchers("/api/v1/student/**").hasAuthority("STUDENT")
//        .antMatchers("/api/v1/security/**").hasAuthority("SECURITY")
        .anyRequest()
        .authenticated()
        .and()
        .sessionManagement()
        .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
        .and()
        .authenticationProvider(authenticationProvider)
        .addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }
}
