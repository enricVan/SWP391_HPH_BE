package fu.swp.dorm_mnm.dto;

import fu.swp.dorm_mnm.model.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

@Getter
@Setter
@NoArgsConstructor
public class UserDto {
    private Long id;
    private String username;
    private String fullName;
    private String role;
    private String email;
    private String gender;
    private String dob;
    private String phone;
    private String address;
    private String status;
    private String createdAt;
    private String updatedAt;

    public UserDto(User user) {
        String pattern = "dd/MM/yyyy HH:mm:ss";
        DateFormat df = new SimpleDateFormat(pattern);

        this.id = user.getId();
        this.username = user.getUsername();
        this.fullName = user.getFullName();
        this.role = user.getRole().getName();
        this.email = user.getEmail();
        this.gender = user.getGender();
//        this.dob = df.format(user.getDateOfBirth());
        this.phone = user.getPhone();
        this.address = user.getAddress();
        this.status = user.getStatus();
        this.createdAt = df.format(user.getCreatedAt());
        this.updatedAt = df.format(user.getUpdatedAt());
    }

}
