package fu.swp.dorm_mnm.service.serviceImpl;

import fu.swp.dorm_mnm.model.Bed;
import fu.swp.dorm_mnm.repository.BedRepository;
import fu.swp.dorm_mnm.service.BedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;


@Service
public class BedServiceImpl implements BedService {
    @Autowired
    private BedRepository bedRepository;

    @Override
    public Iterable<Bed> findAll() {
        return bedRepository.findAllBed();
    }

    @Override
    public Optional<Bed> findById(Long id) {
        return bedRepository.findById(id);
    }

    @Override
    public Bed save(Bed bed) {
        return bedRepository.save(bed);
    }

    @Override
    public void remove(Long id) {
        bedRepository.deleteById(id);
    }
}