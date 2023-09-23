package fu.swp.dorm_mnm.service.serviceImpl;

import fu.swp.dorm_mnm.model.BedRequest;
import fu.swp.dorm_mnm.repository.BedRequestRepository;
import fu.swp.dorm_mnm.service.BedRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.Optional;
@Service
public class BedRequestServiceImpl implements BedRequestService {

    @Autowired
    private BedRequestRepository bedRequestRepository;
    @Override
    public Iterable<BedRequest> findAll() {
        return bedRequestRepository.findAll();
    }

    @Override
    public Optional<BedRequest> findById(Long id) {
        return bedRequestRepository.findById(id);
    }

    @Override
    public BedRequest save(BedRequest bedRequest) {
        return bedRequestRepository.save(bedRequest);
    }

    @Override
    public void remove(Long id) {
        bedRequestRepository.deleteById(id);
    }
}
