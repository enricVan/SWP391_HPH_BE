package fu.swp.dorm_mnm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import fu.swp.dorm_mnm.model.Building;
import fu.swp.dorm_mnm.repository.BuildingRepository;

@RestController
@RequestMapping("/api/v1/building")
@PreAuthorize("hasRole('ADMIN')")
public class BuildingController {

    @Autowired
    private BuildingRepository buildingRepository;

    @GetMapping
    // @PreAuthorize("building:read")
    public ResponseEntity<Iterable<Building>> getAllBuilding() {
        return ResponseEntity.ok(buildingRepository.findAll());
    }
}
