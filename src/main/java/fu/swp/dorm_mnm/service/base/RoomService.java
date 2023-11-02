package fu.swp.dorm_mnm.service.base;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import fu.swp.dorm_mnm.dto.PageDto;
import fu.swp.dorm_mnm.dto.base.RoomDto;
import fu.swp.dorm_mnm.model.Room;

public interface RoomService {

    public Room createNewRoom(RoomDto roomDto);

    public RoomDto save(RoomDto rdto);

    public PageDto<Room> findAll(Pageable pageable);

    public Optional<Room> findById(Long roomId);

    public List<Room> getRoomsByBuildingId(Long buildingId);

    public List<Room> getRoomsByRoomTypeId(Long roomTypeId);

    public List<Room> getRoomsByRoomTypeIdBuildingIdFloorStatus(Long roomTypeId, Long buildingId, Integer Floor,
            String status);
}
