package fu.swp.dorm_mnm.service.base;

import java.util.Optional;

import fu.swp.dorm_mnm.model.RequestApplication;

public interface RequestApplicationService {

    public Iterable<RequestApplication> findAll();

    public Optional<RequestApplication> findById(Long id);

    public RequestApplication save(RequestApplication studentRequest);

    public void remove(Long id);
}
