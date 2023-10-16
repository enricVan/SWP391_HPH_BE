package fu.swp.dorm_mnm.controller;

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

import fu.swp.dorm_mnm.model.Room;
import fu.swp.dorm_mnm.repository.RoomRepository;

@RestController
@RequestMapping("/api/v1/room")
@PreAuthorize("hasAnyRole('STUDENT', 'MANAGER', 'GUARD', 'ADMIN')")
public class RoomController {
    @Autowired
    private RoomRepository roomRepository;

    @PostMapping
    @PreAuthorize("hasAuthority('room:create')")
    public ResponseEntity<Room> createNewRoom(@RequestBody Room bedRequest) {
        return new ResponseEntity<>(roomRepository.save(bedRequest), HttpStatus.OK);
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

    // @PutMapping("/{id}")
    // @PreAuthorize("hasAuthority('room:update')")
    // public ResponseEntity<Room> updateRoom(@PathVariable Long id, @RequestBody Room bedRequest) {
    //     Optional<Room> bedRequestOptional = roomRepository.findById(id);
    //     return bedRequestOptional.map(bedRequest1 -> {
    //         bedRequest.setStatus(bedRequest1.get());
    //         return new ResponseEntity<>(roomRepository.save(bedRequest), HttpStatus.OK);
    //     }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    // }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('room:delete')")
    public ResponseEntity<Room> deleteRoomById(@PathVariable Long id) {
        Optional<Room> bedRequestOptional = roomRepository.findById(id);
        return bedRequestOptional.map(bedRequest -> {
            roomRepository.deleteById(id);
            return new ResponseEntity<>(bedRequest, HttpStatus.OK);
        }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }
}
