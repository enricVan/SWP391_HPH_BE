package fu.swp.dorm_mnm.dto.base;

import com.fasterxml.jackson.annotation.JsonBackReference;

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
    private Long roomId;
    private Long studentId;

    public BedDto(Bed bed) {
        this.id = bed.getBedId();
        this.bedName = bed.getBedName();
        this.status = bed.getStatus();
        this.roomId = bed.getRoom().getRoomId();
        this.studentId = bed.getStudent() != null ? bed.getStudent().getStudentId() : null;
    }

}
