package fu.swp.dorm_mnm.service.base;

import fu.swp.dorm_mnm.dto.base.RoomDto;
import fu.swp.dorm_mnm.model.Room;

public interface RoomService {
    Room createNewRoom(RoomDto roomDto);
}
