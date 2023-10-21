package fu.swp.dorm_mnm.controller;

import fu.swp.dorm_mnm.model.RoomType;
import fu.swp.dorm_mnm.repository.RoomTypeRepository;

import fu.swp.dorm_mnm.service.RoomTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:5173")
@RestController
// @RequestMapping("/api/v1/room-type")
@RequestMapping("/room-type")
@PreAuthorize("hasAnyRole('STUDENT', 'MANAGER', 'GUARD', 'ADMIN')")
public class RoomTypeController {

    @Autowired
    private RoomTypeRepository roomTypeRepository;

    @Autowired
    private RoomTypeService roomTypeService;

    @PostMapping
    @PreAuthorize("hasAuthority('room-type:create')")
    public ResponseEntity<RoomType> createRoomType(@RequestBody RoomType roomType) {
        roomType.setCreatedAt(new Date());
        roomType.setUpdatedAt(new Date());
        return new ResponseEntity<>(roomTypeRepository.save(roomType), HttpStatus.OK);
    }

    @GetMapping
    @PreAuthorize("hasAuthority('room-type:read')")
    public ResponseEntity<Iterable<RoomType>> getAllRoomTypes() {
        return new ResponseEntity<>(roomTypeRepository.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('room-type:read')")
    public ResponseEntity<Optional<RoomType>> getRoomTypeById(@PathVariable Long id) {
        return new ResponseEntity<>(roomTypeRepository.findById(id), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('room-type:update')")
    public ResponseEntity<RoomType> updateRoomTypeById(@PathVariable Long id, @RequestBody RoomType roomTypeRequest) {
        RoomType roomType = roomTypeRepository.findById(id).get();
        roomType.setUpdatedAt(new Date());
        roomType.setRoomTypeName(roomTypeRequest.getRoomTypeName());
        roomType.setRoomTypeDescription(roomTypeRequest.getRoomTypeDescription());
        return new ResponseEntity<>(roomTypeService.save(roomType), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('room-type:delete')")
    public ResponseEntity<String> deleteRoomTypeById(@PathVariable Long id) {
        roomTypeService.remove(id);
        return new ResponseEntity<>("Room Type Deleted", HttpStatus.OK);
    }
}
