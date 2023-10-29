package fu.swp.dorm_mnm.service.base;


import java.util.List;
import java.util.Optional;

import fu.swp.dorm_mnm.model.RoomType;

public interface RoomTypeService {
    //CRUD
    List<RoomType> findAll();

    Optional<RoomType> findById(Long id);

    RoomType save(RoomType roomType);

    void remove(Long id);
}
