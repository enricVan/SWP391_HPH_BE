package fu.swp.dorm_mnm.repository;

import org.springframework.stereotype.Repository;

import fu.swp.dorm_mnm.model.Room;

import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface RoomRepository extends JpaRepository<Room, Long>{
    
}
