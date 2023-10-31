package fu.swp.dorm_mnm.dto.base;

import fu.swp.dorm_mnm.model.Room;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class RoomDto {

    private Long id;

    private String roomName;

    private float roomPrice;

    private Long roomTypeId;

    private Long floor;

    private Long buildingId;

    private String createdAt;

    private String updateAt;

    public RoomDto(Room room) {
        this.id = room.getRoomId();
        this.roomName = room.getRoomName();
//      this.roomPrice = room.getRoomPrice();
        this.floor = room.getFloor();
        this.createdAt = room.getCreatedAt().toString();
        this.updateAt = room.getUpdatedAt().toString();
        this.buildingId = room.getBuilding() != null ? room.getBuilding().getBuildingId() : null;
        this.roomTypeId = room.getRoomType() != null ? room.getRoomType().getRoomTypeId() : null;
    }

}
