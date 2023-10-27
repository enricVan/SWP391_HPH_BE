package fu.swp.dorm_mnm.controller.base;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import fu.swp.dorm_mnm.dto.base.BedDto;
import fu.swp.dorm_mnm.dto.base.RoomDto;
import fu.swp.dorm_mnm.model.Bed;
import fu.swp.dorm_mnm.model.Building;
import fu.swp.dorm_mnm.model.Room;
import fu.swp.dorm_mnm.model.RoomType;
import fu.swp.dorm_mnm.repository.base.BuildingRepository;
import fu.swp.dorm_mnm.repository.base.RoomRepository;
import fu.swp.dorm_mnm.repository.base.RoomTypeRepository;
import fu.swp.dorm_mnm.service.base.BedService;
import fu.swp.dorm_mnm.service.base.RoomService;

@RestController
@RequestMapping("/room")
public class RoomController {
    @Autowired
    private RoomRepository roomRepository;

    @Autowired
    private RoomService roomService;

    @Autowired
    private RoomTypeRepository roomTypeRepository;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private BedService bedService;

    @PostMapping
    @PreAuthorize("hasAuthority('room:create')")
    public ResponseEntity<RoomDto> createNewRoom(@RequestBody RoomDto roomDto) {
        RoomDto resp = roomService.save(roomDto);
        return new ResponseEntity<>(resp, HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('room:read')")
    public ResponseEntity<RoomDto> getRoomById(@PathVariable Long id) {
        Optional<Room> room = roomService.findById(id);
        return room.isPresent() ? new ResponseEntity<>(new RoomDto(room.get()), HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('room:update')")
    public ResponseEntity<Room> updateRoom(@PathVariable Long id, @RequestBody RoomDto roomRequest) {
        Optional<Room> roomRequestOptional = roomRepository.findById(id);
        RoomType roomType = roomTypeRepository.findById(roomRequest.getRoomTypeId()).get();
        Building building = buildingRepository.findById(roomRequest.getBuildingId()).get();
        Room room = new Room(id, roomType, roomRequest.getRoomName(), roomRequest.getFloor(), building,
                roomRequestOptional.get().getBeds(), roomRequest.getRoomPrice(),
                roomRequestOptional.get().getCreatedAt(), new java.util.Date());
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

    @GetMapping
    @PreAuthorize("hasAuthority('room:read')")
    public ResponseEntity<List<RoomDto>> getRoomsByParameters(
            @RequestParam(required = false) Long buildingId,
            @RequestParam(required = false) Long roomTypeId,
            @RequestParam(required = false) Integer floor,
            @RequestParam(required = false) String status) {

        List<Room> roomList = roomService.getRoomsByRoomTypeIdBuildingIdFloorStatus(buildingId, roomTypeId, floor,
                status);
        List<RoomDto> roomDtoList = new ArrayList<>();
        for (Room r : roomList) {
            RoomDto rdto = new RoomDto(r);
            roomDtoList.add(rdto);
        }

        return !roomDtoList.isEmpty() ? new ResponseEntity<>(roomDtoList, HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @PostMapping("/add-rooms")
    @PreAuthorize("hasAuthority('room:create')")
    public ResponseEntity<List<RoomDto>> createBedByRoomId(@RequestBody List<RoomDto> roomDtoList) {
        List<RoomDto> resp = new ArrayList<>();

        for (RoomDto rdto : roomDtoList) {
            resp.add(roomService.save(rdto));
        }

        return new ResponseEntity<>(resp, HttpStatus.CREATED);
    }

}
