package fu.swp.dorm_mnm.controller;

import fu.swp.dorm_mnm.model.BedRequest;
import fu.swp.dorm_mnm.model.RequestApplication;
import fu.swp.dorm_mnm.service.BedRequestService;
import fu.swp.dorm_mnm.service.RequestApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@CrossOrigin(origins = "http://localhost:5173")
@RequestMapping("/api/v1/admin/request-application")
public class RequestApplicationController {

    @Autowired
    private RequestApplicationService requestApplicationService;

    @PostMapping
    public ResponseEntity<RequestApplication> createNewRequestApplication(
            @RequestBody RequestApplication requestApplication) {
        return new ResponseEntity<>(requestApplicationService.save(requestApplication), HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<Iterable<RequestApplication>> getAllRequestApplication() {
        return new ResponseEntity<>(requestApplicationService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<RequestApplication> getRequestApplicationById(@PathVariable Long id) {
        Optional<RequestApplication> requestApplicationOptional = requestApplicationService.findById(id);
        return requestApplicationOptional
                .map(requestApplication -> new ResponseEntity<>(requestApplication, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PutMapping("/{id}")
    public ResponseEntity<RequestApplication> updateBedRequest(@PathVariable Long id,
            @RequestBody RequestApplication requestApplication) {
        Optional<RequestApplication> bedRequestOptional = requestApplicationService.findById(id);
        return bedRequestOptional.map(bedRequest1 -> {
            requestApplication.setStatus(bedRequest1.getStatus());
            return new ResponseEntity<>(requestApplicationService.save(requestApplication), HttpStatus.OK);
        }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

}
