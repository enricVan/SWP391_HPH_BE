package fu.swp.dorm_mnm.controller.bedBooking;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import fu.swp.dorm_mnm.dto.base.BuildingDto;
import fu.swp.dorm_mnm.model.Building;
import fu.swp.dorm_mnm.service.base.BuildingService;
import jakarta.annotation.security.PermitAll;

@RestController
@RequestMapping("/book-bed")
public class BedBookingController {

    @Autowired
    private BuildingService buildingService;

    @GetMapping("/get-all-bed")
    // @PreAuthorize("hasAuthority('bed-request:read')")
    @PermitAll
    public ResponseEntity<List<BuildingDto>> getAllBedByParam() {
        List<Building> listBuilding = buildingService.findAll();
        List<BuildingDto> respBuildingDtos = new ArrayList<>();
        for (Building b : listBuilding) {
            BuildingDto bdto = new BuildingDto(b);
            respBuildingDtos.add(bdto);
        }

        
        return new ResponseEntity<>(respBuildingDtos, HttpStatus.OK);
    }

    // @PostMapping("/book-bed")
    // @PreAuthorize("hasAuthority('bed-request:create')")
    // public ResponseEntity<> bookBed(@RequestParam(required = true) Long bedId,
    // @RequestParam(required = true) Long semester_id, @RequestParam(required =
    // true) Long studentId) {

    // return
    // }
}
