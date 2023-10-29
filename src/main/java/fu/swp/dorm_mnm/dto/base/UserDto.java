package fu.swp.dorm_mnm.dto.base;

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
    private String studentRollNumber;
    private Long managerId;
    private Long guardId;

    public UserDto(User user) {

        String pattern = "dd/MM/yyyy HH:mm:ss";
        DateFormat df = new SimpleDateFormat(pattern);

        String dobPattern = "dd/MM/yyyy";
        DateFormat dfDob = new SimpleDateFormat(dobPattern);

        this.id = user.getId();
        this.username = user.getUsername();
        this.fullName = user.getFullName();
        this.role = user.getRole().getName();
        this.email = user.getEmail();
        this.gender = user.getGender();
         this.dob = dfDob.format(user.getDateOfBirth());
        this.phone = user.getPhone();
        this.address = user.getAddress();
        this.status = user.getStatus();
        this.createdAt = df.format(user.getCreatedAt());
        this.updatedAt = df.format(user.getUpdatedAt());

        this.studentRollNumber = user.getStudent() != null ? user.getStudent().getRollNumber() : null;
        this.managerId = user.getManager() != null ? user.getManager().getManagerId() : null;
        this.guardId = user.getGuard() != null ? user.getGuard().getGuardId() : null;
    }

}
