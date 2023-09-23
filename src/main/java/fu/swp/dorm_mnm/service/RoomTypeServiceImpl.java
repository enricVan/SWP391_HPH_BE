package fu.swp.dorm_mnm.service;

import fu.swp.dorm_mnm.model.RoomType;
import fu.swp.dorm_mnm.repository.RoomTypeRepository;
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

    @Override
    public Iterable<RoomType> findAll() {
        return roomTypeRepository.findAll();
    }
}