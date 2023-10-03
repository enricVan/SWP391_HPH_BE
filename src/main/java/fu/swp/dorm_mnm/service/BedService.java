package fu.swp.dorm_mnm.service;

import fu.swp.dorm_mnm.model.Bed;

import java.util.Optional;


public interface BedService {
    Iterable<Bed> findAll();

    Optional<Bed> findById(Long id);

    Bed save(Bed bed);

    void remove(Long id);
}
