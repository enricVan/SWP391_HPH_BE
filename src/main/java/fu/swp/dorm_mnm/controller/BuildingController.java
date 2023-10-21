package fu.swp.dorm_mnm.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import fu.swp.dorm_mnm.model.Building;
import fu.swp.dorm_mnm.repository.BuildingRepository;
import fu.swp.dorm_mnm.service.BuildingService;
import fu.swp.dorm_mnm.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import fu.swp.dorm_mnm.model.Building;
import fu.swp.dorm_mnm.repository.BuildingRepository;

@CrossOrigin(origins = "http://localhost:5173")
@RestController
// @RequestMapping("/api/v1/building")
@RequestMapping("/building")
@PreAuthorize("hasAnyRole('STUDENT', 'MANAGER', 'GUARD', 'ADMIN')")
public class BuildingController {


    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private BuildingService buildingService;

    @PostMapping
    @PreAuthorize("hasAuthority('building:create')")
    public ResponseEntity<Building> createBuilding(@RequestBody Building building) {
        building.setCreatedAt(new Date());
        building.setUpdatedAt(new Date());
        return new ResponseEntity<>(buildingRepository.save(building), HttpStatus.OK);
    }

    @GetMapping
    @PreAuthorize("hasAuthority('building:read')")
    public ResponseEntity<Iterable<Building>> getAllBuildings() {
        return new ResponseEntity<>(buildingRepository.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('building:read')")
    public ResponseEntity<Optional<Building>> getBuildingById(@PathVariable Long id) {
        return new ResponseEntity<>(buildingRepository.findById(id), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('building:update')")
    public ResponseEntity<Building> updateBuildingById(@PathVariable Long id, @RequestBody Building buildingRequest) {
        Building building = buildingRepository.findById(id).get();
        building.setUpdatedAt(new Date());
        building.setBuildingName(buildingRequest.getBuildingName());
        building.setNumberFloor(buildingRequest.getNumberFloor());
        return new ResponseEntity<>(buildingService.save(building), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('building:delete')")
    public ResponseEntity<String> deleteBuildingById(@PathVariable Long id) {
        buildingService.remove(id);
        return new ResponseEntity<>("Building Deleted", HttpStatus.OK);
    }
}
