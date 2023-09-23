package fu.swp.dorm_mnm.controller;

import fu.swp.dorm_mnm.model.Semester;
import fu.swp.dorm_mnm.service.SemesterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Optional;


@RestController
@CrossOrigin(origins = "http://localhost:5173")
@RequestMapping("/api/v1/admin/semester")
public class SemesterController {

    @Autowired
    private SemesterService semesterService;

    @PostMapping
    public ResponseEntity<Semester> createNewSemester(@RequestBody Semester semester) {
        return new ResponseEntity<>(semesterService.save(semester), HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<Iterable<Semester>> getAllSemester() {
        return new ResponseEntity<>(semesterService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Semester> getRoomById(@PathVariable Long id) {
        Optional<Semester> semesterOptional = semesterService.findById(id);
        return semesterOptional.map(semester -> new ResponseEntity<>(semester, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Semester> deleteSemesterById(@PathVariable Long id) {
        Optional<Semester> semesterOptional = semesterService.findById(id);
        return semesterOptional.map(semester -> {
            semesterService.remove(id);
            return new ResponseEntity<>(semester, HttpStatus.OK);
        }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @GetMapping("/next-semester")
    public ResponseEntity<Semester> getNextSemester() {
        Date currentDate = new Date();
        return new ResponseEntity<>(semesterService.getNextSemester(currentDate), HttpStatus.OK);
    }
}
