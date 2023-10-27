package fu.swp.dorm_mnm.controller.base;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import fu.swp.dorm_mnm.model.BedRequest;
import fu.swp.dorm_mnm.model.Student;
import fu.swp.dorm_mnm.service.base.BedRequestService;
import fu.swp.dorm_mnm.service.base.StudentService;

@RestController

@RequestMapping("/bed-request")
public class BedRequestController {

    @Autowired
    private BedRequestService bedRequestService;

    @Autowired
    private StudentService studentService;

    @PostMapping
    @PreAuthorize("hasAuthority('bed-request:create')")
    public ResponseEntity<String> createNewBedRequest(@RequestParam(required = true) Long studentId,
            @RequestBody BedRequest bedRequest) {
        BedRequest resp = bedRequestService.save(bedRequest, studentId);
        return new ResponseEntity<>("Ticket created! id = " + resp.getBedRequestId(), HttpStatus.OK);
        
    }

    // @GetMapping("/user/{id}")
    // @PreAuthorize("hasAuthority('bed-request:read')")
    // public ResponseEntity<PageDto<BedRequestDto>>
    // getBedRequestByUserId(@PathVariable(name = "id") Long userId,
    // @RequestParam(required = false) String status,
    // @RequestParam(value = "page", defaultValue = "0") int pageNo) {
    // if (status.isEmpty())
    // status = null;
    // Pageable pageable = PageRequest.of(pageNo, 2);
    // PageDto<BedRequestDto> pageDto = bedRequestService.findByUserId(status,
    // userId, pageable);
    // return new ResponseEntity<>(pageDto, HttpStatus.OK);
    // }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('bed-request:read')")
    public ResponseEntity<BedRequest> getBedRequestById(@PathVariable Long id) {
        Optional<BedRequest> bedRequestOptional = bedRequestService.findById(id);
        return bedRequestOptional.map(bedRequest -> new ResponseEntity<>(bedRequest, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('bed-request:update')")
    public ResponseEntity<BedRequest> updateBedRequest(@PathVariable Long id, @RequestBody BedRequest bedRequest) {
        Optional<BedRequest> bedRequestOptional = bedRequestService.findById(id);
        return bedRequestOptional.map(bedRequest1 -> {
            bedRequest.setStatus(bedRequest1.getStatus());
            return new ResponseEntity<>(bedRequestService.save(bedRequest), HttpStatus.OK);
        }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('bed-request:delete')")
    public ResponseEntity<BedRequest> deleteBedRequestById(@PathVariable Long id) {
        Optional<BedRequest> bedRequestOptional = bedRequestService.findById(id);
        return bedRequestOptional.map(bedRequest -> {
            bedRequestService.remove(id);
            return new ResponseEntity<>(bedRequest, HttpStatus.OK);
        }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

}