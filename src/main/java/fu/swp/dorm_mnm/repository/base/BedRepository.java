package fu.swp.dorm_mnm.repository.base;

import fu.swp.dorm_mnm.model.Bed;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;



@Repository
public interface BedRepository extends JpaRepository<Bed, Long> {

}
