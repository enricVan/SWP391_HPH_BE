package fu.swp.dorm_mnm.model;

import jakarta.persistence.*;

import java.util.Collection;
import java.util.Date;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnore;

import fu.swp.dorm_mnm.security.token.Token;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "`user`")
public class User implements UserDetails {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "username", nullable = false, unique = true, length = 20)
  private String username;

  @JsonIgnore
  @Column(name = "password", nullable = false, length = 255)
  private String password;

  @Column(name = "full_name", length = 100)
  private String fullName;

  @Column(name = "email", length = 100)
  private String email;

  @Column(name = "gender", length = 20)
  private String gender;

  @Temporal(TemporalType.DATE)
  @Column(name = "date_of_birth")
  private Date dateOfBirth;

  @Column(name = "phone", length = 20)
  private String phone;

  @Column(name = "address", length = 100)
  private String address;

  @Column(name = "avatar_image", length = 300)
  private String avatarImage;

  @Column(name = "status", length = 50)
  private String status;

  @Temporal(TemporalType.TIMESTAMP)
  @Column(name = "created_at")
  private Date createdAt;

  @Temporal(TemporalType.TIMESTAMP)
  @Column(name = "updated_at")
  private Date updatedAt;

  @OneToOne(mappedBy = "user", targetEntity = Manager.class)
  private Manager manager;

  @OneToOne(mappedBy = "user", targetEntity = Student.class)
  private Student student;

  @JsonIgnore
  @ManyToOne
  @JoinColumn(name = "role_id")
  private Role role;

  // @OneToMany(mappedBy = "user")
  // private List<Token> tokens;

  @JsonIgnore
  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    return role.getAuthorities();
  }

  @Override
  public String getPassword() {
    return password;
  }

  @Override
  public boolean isAccountNonExpired() {
    return true;
  }

  @Override
  public boolean isAccountNonLocked() {
    return true;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  @Override
  public boolean isEnabled() {
    return true;
  }
}
