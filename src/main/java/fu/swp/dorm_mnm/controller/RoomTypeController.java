package fu.swp.dorm_mnm.controller;


import fu.swp.dorm_mnm.model.RoomType;
import fu.swp.dorm_mnm.repository.RoomTypeRepository;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@CrossOrigin(origins = "http://localhost:5173")
@RestController
@RequestMapping("/api/v1/admin/roomType")
public class RoomTypeController {

    @Autowired
    private RoomTypeRepository roomTypeRepository;

    @PostMapping
    public RoomType createRoomType(@RequestBody RoomType roomType) {
        return roomTypeRepository.save(roomType);
    }

    @GetMapping
    public ResponseEntity<Iterable<RoomType>> getAllRoomTypes() {
        return new ResponseEntity<>(roomTypeRepository.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Optional<RoomType>> getRoomTypeById(@PathVariable Long id) {
        return new ResponseEntity<>(roomTypeRepository.findById(id), HttpStatus.OK);
    }

}
