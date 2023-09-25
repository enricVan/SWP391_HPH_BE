package fu.swp.dorm_mnm.service;

import fu.swp.dorm_mnm.model.BedRequest;
import fu.swp.dorm_mnm.model.RequestType;

import java.util.Optional;

public interface RequestTypeService {
    Iterable<RequestType> findAll();

    Optional<RequestType> findById(Long id);

    RequestType save(RequestType requestType);

    void remove(Long id);
}
