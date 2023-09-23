package fu.swp.dorm_mnm.controller;

import fu.swp.dorm_mnm.model.BedRequest;
import fu.swp.dorm_mnm.service.BedRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;


@RestController
@CrossOrigin(origins = "http://localhost:5173")
@RequestMapping("/api/v1/admin/bed-request")
public class BedRequestController {
    @Autowired
    private BedRequestService bedRequestService;

    @PostMapping
    public ResponseEntity<BedRequest> createNewBedRequest(@RequestBody BedRequest bedRequest) {
        return new ResponseEntity<>(bedRequestService.save(bedRequest), HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<Iterable<BedRequest>> getAllBedRequest() {
        return new ResponseEntity<>(bedRequestService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<BedRequest> getRoomById(@PathVariable Long id) {
        Optional<BedRequest> bedRequestOptional = bedRequestService.findById(id);
        return bedRequestOptional.map(bedRequest -> new ResponseEntity<>(bedRequest, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PutMapping("/{id}")
    public ResponseEntity<BedRequest> updateBedRequest(@PathVariable Long id, @RequestBody BedRequest bedRequest) {
        Optional<BedRequest> bedRequestOptional = bedRequestService.findById(id);
        return bedRequestOptional.map(bedRequest1 -> {
            bedRequest.setStatus(bedRequest1.getStatus());
            return new ResponseEntity<>(bedRequestService.save(bedRequest), HttpStatus.OK);
        }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<BedRequest> deleteBedRequestById(@PathVariable Long id) {
        Optional<BedRequest> bedRequestOptional = bedRequestService.findById(id);
        return bedRequestOptional.map(bedRequest -> {
            bedRequestService.remove(id);
            return new ResponseEntity<>(bedRequest, HttpStatus.OK);
        }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }
}
