package fu.swp.dorm_mnm.dto.base;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import fu.swp.dorm_mnm.model.BedRequest;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@NoArgsConstructor
@Getter
@Setter
public class BedRequestDto {
    private Long bedRequestId;
    private String bedName;
    private String semesterName;
    private String buildingName;
    private float price;
    private String roomName;
    private String roomTypeName;
    private String status;
    private String createdAt;
    private String updatedAt;
    private StudentDto StudentDto;


    public BedRequestDto(BedRequest bedRequest){
        String pattern = "dd/MM/yyyy HH:mm:ss";
        DateFormat df = new SimpleDateFormat(pattern);
        this.bedRequestId=bedRequest.getBedRequestId();
        this.status=bedRequest.getStatus();
        this.roomTypeName=bedRequest.getBed().getRoom().getRoomType().getRoomTypeName();
        this.price=bedRequest.getBed().getRoom().getRoomPrice();
        this.roomName=bedRequest.getBed().getRoom().getRoomName();
        this.buildingName=bedRequest.getBed().getRoom().getBuilding().getBuildingName();
        this.semesterName=bedRequest.getSemester().getSemesterName();
        this.createdAt=bedRequest.getCreatedAt()!=null?df.format(bedRequest.getCreatedAt()):null;
        this.updatedAt= bedRequest.getUpdatedAt()!=null?df.format(bedRequest.getUpdatedAt()):null;
        this.bedName=bedRequest.getBed().getBedName();
    }
}