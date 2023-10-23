package fu.swp.dorm_mnm.service.baseImpl;

import fu.swp.dorm_mnm.model.Bed;
import fu.swp.dorm_mnm.repository.base.BedRepository;
import fu.swp.dorm_mnm.service.base.BedService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;


@Service
public class BedServiceImpl implements BedService {
    @Autowired
    private BedRepository bedRepository;

    @Override
    public Iterable<Bed> findAll() {
        return bedRepository.findAll();
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
