package fu.swp.dorm_mnm.service;

import fu.swp.dorm_mnm.model.Room;

import java.util.Optional;

public interface RoomService {
    Iterable<Room> findAll();

    Optional<Room> findById(Integer id);

    Room save(Room room);

    void remove(Integer id);
}
