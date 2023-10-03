 package fu.swp.dorm_mnm.controller;

 import fu.swp.dorm_mnm.model.StudentRequestType;
 import fu.swp.dorm_mnm.service.StudentRequestTypeService;
 import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.http.HttpStatus;
 import org.springframework.http.ResponseEntity;
 import org.springframework.web.bind.annotation.*;

 @RestController
 @CrossOrigin(origins = "http://localhost:5173")
 @RequestMapping("/api/v1/admin/studentRequestType")
 public class StudentRequestTypeController {

     @Autowired
     private StudentRequestTypeService studentRequestTypeService;

     @PostMapping
     public ResponseEntity<StudentRequestType> createNewRequestType(@RequestBody StudentRequestType studentRequestType) {
         return new ResponseEntity<>(studentRequestTypeService.save(studentRequestType), HttpStatus.OK);
     }

     @GetMapping
     public ResponseEntity<Iterable<StudentRequestType>> getAllRequestType() {
         return new ResponseEntity<>(studentRequestTypeService.findAll(), HttpStatus.OK);
     }
 }
