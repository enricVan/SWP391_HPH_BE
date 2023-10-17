package fu.swp.dorm_mnm.repository;

import fu.swp.dorm_mnm.model.PenaltyTicket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PenaltyTicketRepository extends JpaRepository<PenaltyTicket,Long> {
}
