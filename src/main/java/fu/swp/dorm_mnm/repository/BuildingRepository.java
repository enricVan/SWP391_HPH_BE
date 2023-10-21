package fu.swp.dorm_mnm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;

import fu.swp.dorm_mnm.model.Building;

@Repository
public interface BuildingRepository extends JpaRepository<Building, Long> {

    @PreAuthorize("hasAuthority('building:read')")
    List<Building> findAll();
}
