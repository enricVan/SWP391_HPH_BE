package fu.swp.dorm_mnm.service.base;

import java.util.List;
import java.util.Optional;

import fu.swp.dorm_mnm.dto.base.RoomDto;
import fu.swp.dorm_mnm.model.Room;

public interface RoomService {

    public Room createNewRoom(RoomDto roomDto);

    public RoomDto save(RoomDto rdto);

    public List<Room> findAll();

    public Optional<Room> findById(Long roomId);

    public List<Room> getRoomsByBuildingId(Long buildingId);

    public List<Room> getRoomsByRoomTypeId(Long roomTypeId);

    public List<Room> getRoomsByRoomTypeIdBuildingIdFloorStatus(Long roomTypeId, Long buildingId, Integer Floor,
            String status);
}
