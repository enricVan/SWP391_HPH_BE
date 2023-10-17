package fu.swp.dorm_mnm.service.serviceImpl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import fu.swp.dorm_mnm.dto.RoomDto;
import fu.swp.dorm_mnm.model.Building;
import fu.swp.dorm_mnm.model.Room;
import fu.swp.dorm_mnm.model.RoomType;
import fu.swp.dorm_mnm.repository.BuildingRepository;
import fu.swp.dorm_mnm.repository.RoomRepository;
import fu.swp.dorm_mnm.repository.RoomTypeRepository;
import fu.swp.dorm_mnm.service.RoomService;

@Service
public class RoomServiceImpl implements RoomService{
    @Autowired
    private RoomRepository roomRepository;

    @Autowired
    private RoomTypeRepository roomTypeRepository;

    @Autowired
    private BuildingRepository buildingRepository;

    @Override
    public Room createNewRoom(RoomDto roomDto){
        RoomType roomType = roomTypeRepository.findById(roomDto.getRoomType()).get();
        Building building = buildingRepository.findById(roomDto.getBuilding()).get();
        Room room = new Room(null, roomType, roomDto.getRoomName(), roomDto.getFloor(), building, null, roomDto.getRoomPrice(), new Date(), null);
        return room;
    }
}
