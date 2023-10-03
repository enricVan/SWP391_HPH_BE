// package fu.swp.dorm_mnm.controller;

// import fu.swp.dorm_mnm.model.Bed;
// import fu.swp.dorm_mnm.service.BedService;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.http.HttpStatus;
// import org.springframework.http.ResponseEntity;
// import org.springframework.web.bind.annotation.*;

// import java.util.Optional;


// @RestController
// @CrossOrigin(origins = "http://localhost:5173")
// @RequestMapping("/api/v1/admin/bed")
// public class BedController {
//     @Autowired
//     private BedService bedService;

//     @PostMapping
//     public ResponseEntity<Bed> createNewBed(@RequestBody Bed bed) {
//         return new ResponseEntity<>(bedService.save(bed), HttpStatus.OK);
//     }

//     @GetMapping
//     public ResponseEntity<Iterable<Bed>> getAllBed() {
//         return new ResponseEntity<>(bedService.findAll(), HttpStatus.OK);
//     }

//     @GetMapping("/{id}")
//     public ResponseEntity<Bed> getBedById(@PathVariable Long id) {
//         Optional<Bed> bedOptional = bedService.findById(id);
//         return bedOptional.map(bed -> new ResponseEntity<>(bed, HttpStatus.OK))
//                 .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
//     }

//     @DeleteMapping("/{id}")
//     public ResponseEntity<Bed> deleteBedById(@PathVariable Long id) {
//         Optional<Bed> bedOptional = bedService.findById(id);
//         return bedOptional.map(bed -> {
//             bedService.remove(id);
//             return new ResponseEntity<>(bed, HttpStatus.OK);
//         }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
//     }
// }
