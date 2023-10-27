package fu.swp.dorm_mnm.service.baseImpl;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fu.swp.dorm_mnm.dto.base.BedDto;
import fu.swp.dorm_mnm.model.Bed;
import fu.swp.dorm_mnm.model.Room;
import fu.swp.dorm_mnm.repository.base.BedRepository;
import fu.swp.dorm_mnm.repository.base.RoomRepository;
import fu.swp.dorm_mnm.service.base.BedService;

@Service
public class BedServiceImpl implements BedService {

    @Autowired
    private BedRepository bedRepository;

    @Autowired
    private RoomRepository roomRepository;

    @Override
    public Iterable<Bed> findAll() {
        return bedRepository.findAll();
    }

    @Override
    public Optional<Bed> findById(Long id) {
        return bedRepository.findById(id);
    }

    @Override
    public Bed save(Bed bed) {
        return bedRepository.save(bed);
    }

    @Override
    public void remove(Long id) {
        bedRepository.deleteById(id);
    }

    @Override
    public BedDto createBed(BedDto bedto) {
        LocalDateTime now = LocalDateTime.now();
        Timestamp sqlNow = Timestamp.valueOf(now);
        Room room = roomRepository.findById(bedto.getRoomId()).get();

        Bed bed = new Bed();
        bed.setBedName(bedto.getBedName());
        bed.setCreatedAt(sqlNow);
        bed.setUpdatedAt(sqlNow);
        bed.setRoom(room);
        bed.setStatus("Vacant");

        return new BedDto(bedRepository.save(bed));
    }
}
