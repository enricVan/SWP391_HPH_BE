package fu.swp.dorm_mnm.service;


import fu.swp.dorm_mnm.model.Role;
import fu.swp.dorm_mnm.model.RoomType;

import java.util.List;
import java.util.Optional;

public interface RoomTypeService {
    //CRUD
    List<RoomType> findAll();

    Optional<RoomType> findById(Long id);

    RoomType save(RoomType roomType);

    void remove(Long id);
}
