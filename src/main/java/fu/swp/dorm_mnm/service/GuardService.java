package fu.swp.dorm_mnm.service;

import fu.swp.dorm_mnm.model.Guard;
import fu.swp.dorm_mnm.model.User;

import java.util.List;
import java.util.Optional;

public interface GuardService {
    List<Guard> findAll();

    Optional<Guard> findById(Long id);

    Guard save(Guard guard);

    void remove(Long id);

    public Guard getGuardByUserId(Integer userId);
}
