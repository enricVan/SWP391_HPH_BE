package fu.swp.dorm_mnm.service;

import fu.swp.dorm_mnm.model.PenaltyTicket;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface PenaltyTicketService {
    Page<PenaltyTicket> findAll(Pageable pageable);

    List<PenaltyTicket> findAll();

    Optional<PenaltyTicket> findById(Long id);

    PenaltyTicket save(PenaltyTicket penaltyTicket);

    void remove(Long id);

    Page<PenaltyTicket> findByTitleContaining(String title, Pageable pageable);
}
