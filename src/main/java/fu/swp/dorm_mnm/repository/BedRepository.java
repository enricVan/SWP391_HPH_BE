package fu.swp.dorm_mnm.repository;

import fu.swp.dorm_mnm.model.Bed;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;



@Repository
public interface BedRepository extends JpaRepository<Bed, Long> {
    @Query(value = "SELECT created_at, updated_at, bed_id, room_id, bed_name, price, `status` FROM bed", nativeQuery = true)
    Iterable<Bed> findAllBed();
}
