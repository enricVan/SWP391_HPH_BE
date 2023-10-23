package fu.swp.dorm_mnm.dto.base;

import org.springframework.context.annotation.Lazy;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

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
    
    @JsonBackReference
    private RoomDto roomDto;
    private StudentDto studentDto;

    public BedDto(Bed bed) {
        this.id = bed.getBedId();
        this.bedName = bed.getBedName();
        this.status = bed.getStatus();
        this.roomDto = new RoomDto(bed.getRoom());

        // add student ----------------------------------
        if (bed.getStudent() != null) {
            Student student = bed.getStudent();
            StudentDto studentDto = new StudentDto(student);
            this.studentDto = studentDto;
        }
        // -----------------------------------------------
    }

    public BedDto(Bed bed, Room room) {
        this.id = bed.getBedId();
        this.bedName = bed.getBedName();
        this.status = bed.getStatus();
        this.roomDto = new RoomDto(room);

        // add student ----------------------------------
        if (bed.getStudent() != null) {
            Student student = bed.getStudent();
            StudentDto studentDto = new StudentDto(student);
            this.studentDto = studentDto;
        }
        // -----------------------------------------------
    }

}
