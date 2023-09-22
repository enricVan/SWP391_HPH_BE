package fu.swp.dorm_mnm.repository;

import fu.swp.dorm_mnm.model.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface RoomRepository extends JpaRepository<Room, Integer> {
}
