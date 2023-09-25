package fu.swp.dorm_mnm.controller;

import fu.swp.dorm_mnm.model.BedRequest;
import fu.swp.dorm_mnm.model.RequestType;
import fu.swp.dorm_mnm.service.RequestTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "http://localhost:5173")
@RequestMapping("/api/v1/admin/request-type")
public class RequestTypeController {

    @Autowired
    private RequestTypeService requestTypeService;

    @PostMapping
    public ResponseEntity<RequestType> createNewRequestType(@RequestBody RequestType requestType) {
        return new ResponseEntity<>(requestTypeService.save(requestType), HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<Iterable<RequestType>> getAllRequestType() {
        return new ResponseEntity<>(requestTypeService.findAll(), HttpStatus.OK);
    }
}
