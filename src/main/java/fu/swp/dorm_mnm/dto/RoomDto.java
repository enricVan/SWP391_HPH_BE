package fu.swp.dorm_mnm.dto;

import java.util.ArrayList;
import java.util.List;

import fu.swp.dorm_mnm.model.Bed;
import fu.swp.dorm_mnm.model.Room;
import lombok.AllArgsConstructor;
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
    private Long roomType;
    private Long floor;
    private BuildingDto buildingDto;
    private List<BedDto> listBedDto;

    public RoomDto(Room room) {
        this.id = room.getRoomId();
        this.roomName = room.getRoomName();
        this.roomPrice = room.getRoomPrice();
        this.floor = room.getFloor();

        // -----------------------------------------------
        List<Bed> beds = room.getBeds();
        List<BedDto> listBedDto = new ArrayList<>();
        for (Bed b : beds) {
            BedDto bedDto = new BedDto(b);
            listBedDto.add(bedDto);
        }
        this.listBedDto = listBedDto;
        // -----------------------------------------------
    }

}
