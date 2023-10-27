package fu.swp.dorm_mnm.service.base;

import fu.swp.dorm_mnm.model.RequestApplicationType;

import java.util.Optional;

public interface RequestApplicationTypeService {
    
    Iterable<RequestApplicationType> findAll();

    Optional<RequestApplicationType> findById(Long id);

    RequestApplicationType save(RequestApplicationType requestApplicationType);

    void remove(Long id);
}
