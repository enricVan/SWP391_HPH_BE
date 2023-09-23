package fu.swp.dorm_mnm.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import fu.swp.dorm_mnm.model.Room;
import fu.swp.dorm_mnm.repository.RoomRepository;

@RestController
@RequestMapping("/api/v1/admin/room")
public class RoomController {
    @Autowired
    private RoomRepository roomRepository;

    @PostMapping
    public ResponseEntity<Room> createNewRoom(@RequestBody Room bedRequest) {
        return new ResponseEntity<>(roomRepository.save(bedRequest), HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<Iterable<Room>> getAllRoom() {
        return new ResponseEntity<>(roomRepository.findAll(), HttpStatus.OK);
    }

    // @GetMapping("/{id}")
    // public ResponseEntity<Room> getRoomById(@PathVariable Long id) {
    //     Optional<Room> bedRequestOptional = roomRepository.findById(id);
    //     return bedRequestOptional.map(bedRequest -> new ResponseEntity<>(bedRequest, HttpStatus.OK))
    //             .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    // }

    // @PutMapping("/{id}")
    // public ResponseEntity<Room> updateRoom(@PathVariable Long id, @RequestBody Room bedRequest) {
    //     Optional<Room> bedRequestOptional = roomRepository.findById(id);
    //     return bedRequestOptional.map(bedRequest1 -> {
    //         bedRequest.setStatus(bedRequest1.getStatus());
    //         return new ResponseEntity<>(roomRepository.save(bedRequest), HttpStatus.OK);
    //     }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    // }

    // @DeleteMapping("/{id}")
    // public ResponseEntity<Room> deleteRoomById(@PathVariable Long id) {
    //     Optional<Room> bedRequestOptional = roomRepository.findById(id);
    //     return bedRequestOptional.map(bedRequest -> {
    //         roomRepository.remove(id);
    //         return new ResponseEntity<>(bedRequest, HttpStatus.OK);
    //     }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    // }
}
