 package fu.swp.dorm_mnm.controller;

 import fu.swp.dorm_mnm.model.BedRequest;
 import fu.swp.dorm_mnm.model.StudentRequest;
 import fu.swp.dorm_mnm.service.BedRequestService;
 import fu.swp.dorm_mnm.service.StudentRequestService;
 import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.http.HttpStatus;
 import org.springframework.http.ResponseEntity;
 import org.springframework.web.bind.annotation.*;

 import java.util.Optional;

 @RestController
 @CrossOrigin(origins = "http://localhost:5173")
 @RequestMapping("/api/v1/admin/studentRequest")
 public class StudentRequestController {

     @Autowired
     private StudentRequestService studentRequestService;

     @PostMapping
     public ResponseEntity<StudentRequest> createNewStudentRequest(@RequestBody StudentRequest studentRequest) {
         return new ResponseEntity<>(studentRequestService.save(studentRequest), HttpStatus.OK);
     }

     @GetMapping
     public ResponseEntity<Iterable<StudentRequest>> getAllStudentRequest() {
         return new ResponseEntity<>(studentRequestService.findAll(), HttpStatus.OK);
     }

     @GetMapping("/{id}")
     public ResponseEntity<StudentRequest> getStudentRequestById(@PathVariable Long id) {
         Optional<StudentRequest> studentRequestOptional = studentRequestService.findById(id);
         return studentRequestOptional.map(studentRequest -> new ResponseEntity<>(studentRequest, HttpStatus.OK))
                 .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
     }

     @PutMapping("/{id}")
     public ResponseEntity<StudentRequest> updateBedRequest(@PathVariable Long id, @RequestBody StudentRequest studentRequest) {
         Optional<StudentRequest> bedRequestOptional = studentRequestService.findById(id);
         return bedRequestOptional.map(bedRequest1 -> {
             studentRequest.setStatus(bedRequest1.getStatus());
             return new ResponseEntity<>(studentRequestService.save(studentRequest), HttpStatus.OK);
         }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
     }

 }
