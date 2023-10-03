package fu.swp.dorm_mnm.service;

import fu.swp.dorm_mnm.model.BedRequest;

import java.util.Optional;


public interface BedRequestService {

    Iterable<BedRequest> findAll();

    Optional<BedRequest> findById(Long id);

    BedRequest save(BedRequest bedRequest);

    void remove(Long id);
}
