package fu.swp.dorm_mnm.controller;

import fu.swp.dorm_mnm.dto.BedRequestDto;
import fu.swp.dorm_mnm.dto.BuildingDto;
import fu.swp.dorm_mnm.dto.PageDto;
import fu.swp.dorm_mnm.model.Bed;
import fu.swp.dorm_mnm.model.BedRequest;
import fu.swp.dorm_mnm.model.Building;
import fu.swp.dorm_mnm.model.Room;
import fu.swp.dorm_mnm.model.RoomType;
import fu.swp.dorm_mnm.repository.BedRequestRepository;
import fu.swp.dorm_mnm.repository.BuildingRepository;
import fu.swp.dorm_mnm.service.BedRequestService;
import fu.swp.dorm_mnm.service.BuildingService;
import fu.swp.dorm_mnm.service.RoomTypeService;
import jakarta.annotation.security.PermitAll;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
// @CrossOrigin(origins = "http://localhost:5173")
// @RequestMapping("/api/v1/bed-request")
@RequestMapping("/bed-request")
// @PreAuthorize("hasAnyRole('STUDENT', 'MANAGER', 'GUARD')")
public class BedRequestController {

    @Autowired
    private BedRequestService bedRequestService;

    @Autowired
    private BedRequestRepository bedRequestRepository;

    @Autowired
    private BuildingService buildingService;

    @Autowired
    private RoomTypeService roomTypeService;

    @PostMapping
    @PreAuthorize("hasAuthority('bed-request:create')")
    public ResponseEntity<BedRequest> createNewBedRequest(@RequestBody BedRequest bedRequest) {
        return new ResponseEntity<>(bedRequestService.save(bedRequest), HttpStatus.OK);
    }

    @GetMapping("/list-all-bed")
    @PreAuthorize("hasAuthority('bed-request:read')")
    public ResponseEntity<List<BuildingDto>> getAllBedByParam() {
        List<Building> listBuilding = buildingService.findAll();
        List<BuildingDto> respBuildingDtos = new ArrayList<>();
        for (Building b : listBuilding) {
            BuildingDto bdto = new BuildingDto(b);
            respBuildingDtos.add(bdto);
        }
        return new ResponseEntity<>(respBuildingDtos, HttpStatus.OK);
    }

    

    

    @GetMapping("/user/{id}")
    @PreAuthorize("hasAuthority('bed-request:read')")
    public ResponseEntity<PageDto<BedRequestDto>> getBedRequestByUserId(@PathVariable(name = "id") Long userId,
            @RequestParam(required = false) String status,
            @RequestParam(value = "page", defaultValue = "0") int pageNo) {
        if (status.isEmpty())
            status = null;
        Pageable pageable = PageRequest.of(pageNo, 2);
        PageDto<BedRequestDto> pageDto = bedRequestService.findByUserId(status, userId, pageable);
        return new ResponseEntity<>(pageDto, HttpStatus.OK);
    }

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
