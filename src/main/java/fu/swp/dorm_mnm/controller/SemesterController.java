package fu.swp.dorm_mnm.controller;

import fu.swp.dorm_mnm.model.Semester;
import fu.swp.dorm_mnm.service.SemesterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Optional;

@RestController
@CrossOrigin(origins = "http://localhost:5173")
@RequestMapping("/api/v1/semester")
@PreAuthorize("hasAnyRole('STUDENT', 'MANAGER', 'GUARD', 'ADMIN')")
public class SemesterController {

    @Autowired
    private SemesterService semesterService;

    @PostMapping
    @PreAuthorize("hasAuthority('semester:create')")
    public ResponseEntity<Semester> createNewSemester(@RequestBody Semester semester) {
        return new ResponseEntity<>(semesterService.save(semester), HttpStatus.OK);
    }

    @GetMapping
    @PreAuthorize("hasAuthority('semester:read')")
    public ResponseEntity<Iterable<Semester>> getAllSemester() {
        return new ResponseEntity<>(semesterService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('semester:read')")
    public ResponseEntity<Semester> getRoomById(@PathVariable Long id) {
        Optional<Semester> semesterOptional = semesterService.findById(id);
        return semesterOptional.map(semester -> new ResponseEntity<>(semester, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('semester:delete')")
    public ResponseEntity<Semester> deleteSemesterById(@PathVariable Long id) {
        Optional<Semester> semesterOptional = semesterService.findById(id);
        return semesterOptional.map(semester -> {
            semesterService.remove(id);
            return new ResponseEntity<>(semester, HttpStatus.OK);
        }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @GetMapping("/next-semester")
    @PreAuthorize("hasAuthority('semester:read')")
    public ResponseEntity<Semester> getNextSemester() {
        Date currentDate = new Date();
        return new ResponseEntity<>(semesterService.getNextSemester(currentDate), HttpStatus.OK);
    }
}
