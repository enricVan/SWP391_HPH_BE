package fu.swp.dorm_mnm.service;


import fu.swp.dorm_mnm.model.RoomType;

public interface RoomTypeService {
    //CRUD
    void save(RoomType roomType);

    Iterable<RoomType> findAll();
}
