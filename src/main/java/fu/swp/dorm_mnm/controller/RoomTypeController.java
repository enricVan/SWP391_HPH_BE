package fu.swp.dorm_mnm.controller;


import fu.swp.dorm_mnm.model.RoomType;
import fu.swp.dorm_mnm.repository.RoomTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

// @CrossOrigin(origins = "http://localhost:5173")
@RestController
@RequestMapping("/api/v1/admin/roomtype")
public class RoomTypeController {

    @Autowired
    private RoomTypeRepository roomTypeRepository;

    @GetMapping
    public ResponseEntity<Iterable<RoomType>> getAllRoom() {
        return new ResponseEntity<>(roomTypeRepository.findAll(), HttpStatus.OK);
    }
 

    @PostMapping
    public RoomType createRoomType(@RequestBody RoomType roomType) {
        return roomTypeRepository.save(roomType);
    }

}
