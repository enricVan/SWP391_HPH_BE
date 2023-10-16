 package fu.swp.dorm_mnm.controller;

 import fu.swp.dorm_mnm.model.RequestApplicationType;
 import fu.swp.dorm_mnm.service.RequestApplicationTypeService;
 import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.http.HttpStatus;
 import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

 @RestController
 @CrossOrigin(origins = "http://localhost:5173")
 @RequestMapping("/api/v1/request-application-type")
 @PreAuthorize("hasAnyRole('STUDENT', 'MANAGER')")
 public class RequestApplicationTypeController {

     @Autowired
     private RequestApplicationTypeService requestApplicationTypeService;

     @PostMapping
     @PreAuthorize("hasAuthority('request-application-type:create')")
     public ResponseEntity<RequestApplicationType> createNewRequestType(@RequestBody RequestApplicationType requestApplicationType) {
         return new ResponseEntity<>(requestApplicationTypeService.save(requestApplicationType), HttpStatus.OK);
     }

     @GetMapping
     @PreAuthorize("hasAuthority('request-application-type:read')")
     public ResponseEntity<Iterable<RequestApplicationType>> getAllRequestType() {
         return new ResponseEntity<>(requestApplicationTypeService.findAll(), HttpStatus.OK);
     }
 }
