package fu.swp.dorm_mnm.service;

import fu.swp.dorm_mnm.dto.RoomDto;
import fu.swp.dorm_mnm.model.Room;

public interface RoomService {
    Room createNewRoom(RoomDto roomDto);
}
