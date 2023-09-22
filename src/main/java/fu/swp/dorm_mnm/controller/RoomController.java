package fu.swp.dorm_mnm.controller;

import fu.swp.dorm_mnm.model.Room;
import fu.swp.dorm_mnm.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@CrossOrigin(origins = "http://localhost:5173")
@RequestMapping("/api/v1/admin/room")
public class RoomController {
    @Autowired
    private RoomService roomService;

    @PostMapping
    public ResponseEntity<Room> createNewRoom(@RequestBody Room room) {
        return new ResponseEntity<>(roomService.save(room), HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<Iterable<Room>> getAllRoom() {
        return new ResponseEntity<>(roomService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Room> getRoomById(@PathVariable Integer id) {
        Optional<Room> roomOptional = roomService.findById(id);
        return roomOptional.map(room -> new ResponseEntity<>(room, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Room> deleteRoomById(@PathVariable Integer id) {
        Optional<Room> roomOptional = roomService.findById(id);
        return roomOptional.map(room -> {
            roomService.remove(id);
            return new ResponseEntity<>(room, HttpStatus.OK);
        }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }
}
