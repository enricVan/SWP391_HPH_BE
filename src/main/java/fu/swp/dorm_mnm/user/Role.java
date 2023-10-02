package fu.swp.dorm_mnm.user;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import static fu.swp.dorm_mnm.user.Permission.ADMIN_CREATE;
import static fu.swp.dorm_mnm.user.Permission.ADMIN_DELETE;
import static fu.swp.dorm_mnm.user.Permission.ADMIN_READ;
import static fu.swp.dorm_mnm.user.Permission.ADMIN_UPDATE;
import static fu.swp.dorm_mnm.user.Permission.MANAGER_CREATE;
import static fu.swp.dorm_mnm.user.Permission.MANAGER_DELETE;
import static fu.swp.dorm_mnm.user.Permission.MANAGER_READ;
import static fu.swp.dorm_mnm.user.Permission.MANAGER_UPDATE;

@RequiredArgsConstructor
@Entity
public class Role {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "role_id")
        private Long id;

        @Column(name = "role_name")
        private String name;

        // @Getter
        // private final Set<Permission> permissions;

        public List<SimpleGrantedAuthority> getAuthorities() {
                // var authorities = getPermissions()
                // .stream()
                // .map(permission -> new SimpleGrantedAuthority(permission.getPermission()))
                // .collect(Collectors.toList());
                List<SimpleGrantedAuthority> authorities = new ArrayList<>();
                authorities.add(new SimpleGrantedAuthority("ROLE_"+name));
                authorities.add(new SimpleGrantedAuthority("admin:read"));
                return authorities;
        }
}
