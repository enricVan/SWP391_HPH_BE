package fu.swp.dorm_mnm.service.baseImpl;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fu.swp.dorm_mnm.dto.base.RoomDto;
import fu.swp.dorm_mnm.model.Building;
import fu.swp.dorm_mnm.model.Room;
import fu.swp.dorm_mnm.model.RoomType;
import fu.swp.dorm_mnm.repository.base.BuildingRepository;
import fu.swp.dorm_mnm.repository.base.RoomRepository;
import fu.swp.dorm_mnm.repository.base.RoomTypeRepository;
import fu.swp.dorm_mnm.service.base.RoomService;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomRepository roomRepository;

    @Autowired
    private RoomTypeRepository roomTypeRepository;

    @Autowired
    private BuildingRepository buildingRepository;

    @Override
    public Room createNewRoom(RoomDto roomDto) {
        RoomType roomType = roomTypeRepository.findById(roomDto.getRoomTypeId()).get();
        Building building = buildingRepository.findById(roomDto.getBuildingId()).get();
        Room room = new Room();
        
        return room;
    }

    @Override
    public List<Room> findAll() {
        return roomRepository.findAll();
    }

    @Override
    public List<Room> getRoomsByBuildingId(Long buildingId) {
        return roomRepository.getRoomsByBuildingId(buildingId);
    }

    @Override
    public List<Room> getRoomsByRoomTypeId(Long roomTypeId) {
        return roomRepository.getRoomsByRoomTypeId(roomTypeId);
    }

    @Override
    public List<Room> getRoomsByRoomTypeIdBuildingIdFloorStatus(Long roomTypeId, Long buildingId, Integer floor,
            String status) {
        return roomRepository.getRoomsByRoomTypeIdBuildingIdFloorStatus(roomTypeId, buildingId, floor, status);
    }

    @Override
    public Optional<Room> findById(Long roomId) {
        return roomRepository.findById(roomId);
    }

    @Override
    public RoomDto save(RoomDto rdto) {

        LocalDateTime now = LocalDateTime.now();
        Timestamp sqlNow = Timestamp.valueOf(now);

        Room room = new Room();

        room.setBuilding(buildingRepository.findById(rdto.getBuildingId()).get());
        room.setCreatedAt(sqlNow);
        room.setUpdatedAt(sqlNow);
        room.setFloor(rdto.getFloor());
        room.setRoomName(rdto.getRoomName());
        room.setRoomType(roomTypeRepository.findById(rdto.getRoomTypeId()).get());

        return new RoomDto(roomRepository.save(room));
    }

}
