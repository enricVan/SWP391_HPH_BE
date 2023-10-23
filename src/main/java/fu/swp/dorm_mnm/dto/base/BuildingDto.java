package fu.swp.dorm_mnm.dto.base;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.mapping.Array;

import fu.swp.dorm_mnm.model.Building;
import fu.swp.dorm_mnm.model.Room;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class BuildingDto {
    private Long id;
    private String buildingName;
    private int numberFloor;
    private String createdAt;
    private String updateAt;
    private List<RoomDto> listRoomDto;

    public BuildingDto(Building b) {
        this.id = b.getBuildingId();
        this.buildingName = b.getBuildingName();
        this.numberFloor = b.getNumberFloor();
        this.createdAt = b.getCreatedAt().toString();
        this.updateAt = b.getUpdatedAt().toString();

        // -----------------------------------------------
        List<Room> rooms = b.getRooms();
        List<RoomDto> listRoomDto = new ArrayList<>();
        for (Room r : rooms) {
            RoomDto roomDto = new RoomDto(r);
            listRoomDto.add(roomDto);
        }
        this.listRoomDto = listRoomDto;
        // -----------------------------------------------
    }

}
