package fu.swp.dorm_mnm.dto;

import fu.swp.dorm_mnm.model.Bed;
import fu.swp.dorm_mnm.model.Room;
import fu.swp.dorm_mnm.model.Student;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class BedDto {
    private Long id;
    private String bedName;
    private String status;
    private RoomDto roomDto;
    private StudentDto studentDto;

    public BedDto(Bed bed) {
        this.id = bed.getBedId();
        this.bedName = bed.getBedName();
        this.status = bed.getStatus();

        // add student ----------------------------------
        if (bed.getStudent() != null) {
            Student student = bed.getStudent();
            StudentDto studentDto = new StudentDto(student);
            this.studentDto = studentDto;
        }
        // -----------------------------------------------
    }

}
