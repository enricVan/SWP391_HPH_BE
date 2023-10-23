package fu.swp.dorm_mnm.service.base;

import fu.swp.dorm_mnm.model.Building;

import java.util.List;
import java.util.Optional;

public interface BuildingService {
    List<Building> findAll();

    Optional<Building> findById(Long id);

    Building save(Building building);

    void remove(Long id);
}