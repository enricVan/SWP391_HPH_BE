package fu.swp.dorm_mnm.service.baseImpl;

import fu.swp.dorm_mnm.exception.ResourceNotFoundException;
import fu.swp.dorm_mnm.model.Building;
import fu.swp.dorm_mnm.repository.base.BuildingRepository;
import fu.swp.dorm_mnm.service.base.BuildingService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private BuildingRepository buildingRepository;

    @Override
    public List<Building> findAll() {
        return buildingRepository.findAll();
    }

    @Override
    public Optional<Building> findById(Long id) {
        return buildingRepository.findById(id);
    }

    @Override
    public void remove(Long id) {
        Building building=buildingRepository.findById(id).orElseThrow(()->new ResourceNotFoundException("Building Not Found"));
        buildingRepository.delete(building);
    }

    @Override
    public Building save(Building building) {
        return buildingRepository.save(building);
    }
}