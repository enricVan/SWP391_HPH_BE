package fu.swp.dorm_mnm.service.serviceImpl;

import fu.swp.dorm_mnm.model.RoomType;
import fu.swp.dorm_mnm.repository.RoomTypeRepository;
import fu.swp.dorm_mnm.service.RoomTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomTypeServiceImpl implements RoomTypeService {

    @Autowired
    private RoomTypeRepository roomTypeRepository;

    @Override
    public void save(RoomType roomType) {
        roomTypeRepository.save(roomType);
    }
}
