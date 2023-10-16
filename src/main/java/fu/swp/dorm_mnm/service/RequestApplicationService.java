package fu.swp.dorm_mnm.service;

import fu.swp.dorm_mnm.model.Semester;
import fu.swp.dorm_mnm.model.RequestApplication;

import java.util.Optional;

public interface RequestApplicationService {
    
    Iterable<RequestApplication> findAll();

    Optional<RequestApplication> findById(Long id);

    RequestApplication save(RequestApplication studentRequest);

    void remove(Long id);
}
