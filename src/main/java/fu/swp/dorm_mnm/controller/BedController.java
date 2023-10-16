package fu.swp.dorm_mnm.controller;

import fu.swp.dorm_mnm.exception.ResourceNotFoundException;
import fu.swp.dorm_mnm.model.Bed;
import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.service.BedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@CrossOrigin(origins = "http://localhost:5173")
@RequestMapping("/api/v1/bed")
@PreAuthorize("hasAnyRole('STUDENT', 'MANAGER', 'GUARD')")
public class BedController {
    @Autowired
    private BedService bedService;

    @PostMapping
    @PreAuthorize("hasAuthority('bed:create')")
    public ResponseEntity<Bed> createNewBed(@RequestBody Bed bed) {
        return new ResponseEntity<>(bedService.save(bed), HttpStatus.OK);
    }

    @GetMapping
    @PreAuthorize("hasAuthority('bed:read')")
    public ResponseEntity<Iterable<Bed>> getAllBed() {
        return new ResponseEntity<>(bedService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('bed:read')")
    public ResponseEntity<Bed> getBedById(@PathVariable Long id) {
        Optional<Bed> bedOptional = bedService.findById(id);
        return bedOptional.map(bed -> new ResponseEntity<>(bed, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('bed:update')")
    public ResponseEntity<Bed> updateStatus(@PathVariable Long id, @RequestBody Bed bed) {
        Bed bed2 = bedService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User not exist with id :" + id));

        bedService.save(bed);
        return ResponseEntity.ok(bed);
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('bed:delete')")
    public ResponseEntity<Bed> deleteBedById(@PathVariable Long id) {
        Optional<Bed> bedOptional = bedService.findById(id);
        return bedOptional.map(bed -> {
            bedService.remove(id);
            return new ResponseEntity<>(bed, HttpStatus.OK);
        }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }
}
