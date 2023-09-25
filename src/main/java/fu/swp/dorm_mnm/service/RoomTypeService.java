package fu.swp.dorm_mnm.service;


import fu.swp.dorm_mnm.model.Role;
import fu.swp.dorm_mnm.model.RoomType;

import java.util.Optional;

public interface RoomTypeService {
    //CRUD
    Iterable<RoomType> findAll();

    Optional<RoomType> findById(Long id);

    RoomType save(RoomType roomType);

    void remove(Long id);
}
