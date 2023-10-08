 package fu.swp.dorm_mnm.controller;


 import fu.swp.dorm_mnm.model.RoomType;
 import fu.swp.dorm_mnm.repository.RoomTypeRepository;


 import fu.swp.dorm_mnm.service.RoomTypeService;
 import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.http.HttpStatus;
 import org.springframework.http.ResponseEntity;
 import org.springframework.web.bind.annotation.*;

 import java.util.Date;
 import java.util.Optional;

 @CrossOrigin(origins = "http://localhost:5173")
 @RestController
 @RequestMapping("/api/v1/admin/roomType")
 public class RoomTypeController {

     @Autowired
     private RoomTypeRepository roomTypeRepository;
    @Autowired
    private RoomTypeService roomTypeService;
     @PostMapping
     public ResponseEntity<RoomType> createRoomType(@RequestBody RoomType roomType) {
         roomType.setCreatedAt(new Date());
         roomType.setUpdatedAt(new Date());
         return new ResponseEntity<>(roomTypeRepository.save(roomType),HttpStatus.OK);
     }

     @GetMapping
     public ResponseEntity<Iterable<RoomType>> getAllRoomTypes() {
         return new ResponseEntity<>(roomTypeRepository.findAll(), HttpStatus.OK);
     }

     @GetMapping("/{id}")
     public ResponseEntity<Optional<RoomType>> getRoomTypeById(@PathVariable Long id) {
         return new ResponseEntity<>(roomTypeRepository.findById(id), HttpStatus.OK);
     }
     @PutMapping
     public ResponseEntity<RoomType> updateRoomTypeById(@RequestBody RoomType roomType){
         roomType.setUpdatedAt(new Date());
        return new ResponseEntity<>(roomTypeService.save(roomType),HttpStatus.OK);
     }
     @DeleteMapping("/{id}")
     public ResponseEntity<String> deleteRoomTypeById(@PathVariable Long id){
         roomTypeService.remove(id);
         return new ResponseEntity<>("Room Type Deleted",HttpStatus.OK);
     }
 }
