package fu.swp.dorm_mnm.model;

import jakarta.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.authority.SimpleGrantedAuthority;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "role_id")
    private Long roleId;

    @Column(name = "role_name", length = 20, nullable = false)
    private String roleName;

    @Column(name = "description", length = 200)
    private String description;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at")
    private Date createdAt;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at")
    private Date updatedAt;

    // @OneToMany(mappedBy = "role")
    // private List<User> users;

    // @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    // @JoinTable(
    //         name = "role_feature",
    //         joinColumns = @JoinColumn(name = "role_id"),
    //         inverseJoinColumns = @JoinColumn(name = "feature_id")
    // )
    // private List<Feature> features;

    public List<SimpleGrantedAuthority> getAuthorities() {
                // var authorities = getPermissions()
                // .stream()
                // .map(permission -> new SimpleGrantedAuthority(permission.getPermission()))
                // .collect(Collectors.toList());
                List<SimpleGrantedAuthority> authorities = new ArrayList<>();
                authorities.add(new SimpleGrantedAuthority("ROLE_" + roleName));
                authorities.add(new SimpleGrantedAuthority("admin:read"));
                return authorities;
        }
}
