package fu.swp.dorm_mnm.dto;

import fu.swp.dorm_mnm.model.Student;
import fu.swp.dorm_mnm.model.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class StudentDto {

    private Long id;
    private String parentName;
    private String rollNumber;
    private String createdAt;
    private String updateAt;
    private UserDto userDto;

    public StudentDto(Student student) {
        this.id = student.getStudentId();
        this.parentName = student.getParentName();
        this.rollNumber = student.getRollNumber();
        this.createdAt = student.getCreatedAt().toString();
        this.updateAt = student.getUpdatedAt().toString();
    }

    public StudentDto(User user) {
        Student student = user.getStudent();
        this.parentName = student.getParentName();
        this.rollNumber = student.getRollNumber();
        this.createdAt = student.getCreatedAt().toString();
        this.updateAt = student.getUpdatedAt().toString();
        // UserDto userDto = new UserDto(user);
        // this.userDto = userDto;
    }

}
