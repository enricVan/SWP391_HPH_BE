package fu.swp.dorm_mnm.service.serviceImpl;

import fu.swp.dorm_mnm.model.Guard;
import fu.swp.dorm_mnm.repository.GuardRepository;
import fu.swp.dorm_mnm.repository.GuardRepository;
import fu.swp.dorm_mnm.service.GuardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class GuardServiceImpl implements GuardService {
    @Autowired
    private GuardRepository guardRepository;

    @Override
    public List<Guard> findAll() {
        return guardRepository.findAll();
    }

    @Override
    public Optional<Guard> findById(Long id) {
        return guardRepository.findById(id);
    }

    @Override
    public Guard save(Guard guard) {
        return guardRepository.save(guard);
    }

    @Override
    public void remove(Long id) {
        guardRepository.deleteById(id);
    }
}
