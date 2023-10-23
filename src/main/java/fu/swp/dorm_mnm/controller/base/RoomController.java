package fu.swp.dorm_mnm.controller.base;

import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import fu.swp.dorm_mnm.dto.base.RoomDto;
import fu.swp.dorm_mnm.model.Building;
import fu.swp.dorm_mnm.model.Room;
import fu.swp.dorm_mnm.model.RoomType;
import fu.swp.dorm_mnm.repository.base.BuildingRepository;
import fu.swp.dorm_mnm.repository.base.RoomRepository;
import fu.swp.dorm_mnm.repository.base.RoomTypeRepository;
import fu.swp.dorm_mnm.service.base.RoomService;
import fu.swp.dorm_mnm.service.baseImpl.RoomServiceImpl;

@RestController
// @RequestMapping("/api/v1/room")
@RequestMapping("/room")
@PreAuthorize("hasAnyRole('STUDENT', 'MANAGER', 'GUARD', 'ADMIN')")
public class RoomController {
    @Autowired
    private RoomRepository roomRepository;

    @Autowired
    private RoomService roomService;

    @Autowired
    private RoomTypeRepository roomTypeRepository;

    @Autowired
    private BuildingRepository buildingRepository;

    @PostMapping
    @PreAuthorize("hasAuthority('room:create')")
    public ResponseEntity<Room> createNewRoom(@RequestBody RoomDto roomReq) {
        Room room = roomService.createNewRoom(roomReq);
        return new ResponseEntity<>(roomRepository.save(room), HttpStatus.OK);
    }

    @GetMapping
    @PreAuthorize("hasAuthority('room:read')")
    public ResponseEntity<Iterable<Room>> getAllRoom() {
        return new ResponseEntity<>(roomRepository.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('room:read')")
    public ResponseEntity<Room> getRoomById(@PathVariable Long id) {
        Optional<Room> bedRequestOptional = roomRepository.findById(id);
        return bedRequestOptional.map(bedRequest -> new ResponseEntity<>(bedRequest,
                HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('room:update')")
    public ResponseEntity<Room> updateRoom(@PathVariable Long id, @RequestBody RoomDto roomRequest) {
        Optional<Room> roomRequestOptional = roomRepository.findById(id);
        RoomType roomType = roomTypeRepository.findById(roomRequest.getRoomType()).get();
        Building building = buildingRepository.findById(roomRequest.getBuildingDto().getId()).get();
        Room room = new Room(id, roomType, roomRequest.getRoomName(), roomRequest.getFloor(), building,
                roomRequestOptional.get().getBeds(), roomRequest.getRoomPrice(),
                roomRequestOptional.get().getCreatedAt(), new Date());
        return roomRequestOptional.map(roomRequest1 -> {
            return new ResponseEntity<>(roomRepository.save(room), HttpStatus.OK);
        }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('room:delete')")
    public ResponseEntity<Room> deleteRoomById(@PathVariable Long id) {
        Optional<Room> roomRequestOptional = roomRepository.findById(id);
        return roomRequestOptional.map(bedRequest -> {
            roomRepository.deleteById(id);
            return new ResponseEntity<>(bedRequest, HttpStatus.OK);
        }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }
}
