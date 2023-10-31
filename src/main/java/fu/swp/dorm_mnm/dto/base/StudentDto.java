package fu.swp.dorm_mnm.dto.base;

import fu.swp.dorm_mnm.model.Bed;
import fu.swp.dorm_mnm.model.Room;
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
    private String roomName;
    private String bedName;
    private String buildingName;
    private String roomTypeName;
    private Integer floor;
    private UserDto userDto;

    public StudentDto(Student student) {
        this.id = student.getStudentId();
        this.parentName = student.getParentName();
        this.rollNumber = student.getRollNumber();
        this.createdAt = student.getCreatedAt().toString();
        this.updateAt = student.getUpdatedAt().toString();

        Bed bed = student.getBed();
        if (bed != null) {
            Room room = bed.getRoom();
            this.bedName = bed.getBedName();
            this.roomName = room.getRoomName();
            this.buildingName = room.getBuilding().getBuildingName();
            this.roomTypeName = room.getRoomType().getRoomTypeName();
        }

        this.userDto = new UserDto(student.getUser());
    }

    public StudentDto(User user) {
        Student student = user.getStudent();
        this.parentName = student.getParentName();
        this.rollNumber = student.getRollNumber();
        this.createdAt = student.getCreatedAt().toString();
        this.updateAt = student.getUpdatedAt().toString();
    }

}
