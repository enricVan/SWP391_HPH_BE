package fu.swp.dorm_mnm.service;

import fu.swp.dorm_mnm.model.PenaltyTicket;

import java.util.List;
import java.util.Optional;

public interface PenaltyTicketService {

    List<PenaltyTicket> findAll();

    Optional<PenaltyTicket> findById(Long id);

    PenaltyTicket save(PenaltyTicket penaltyTicket);

    void remove(Long id);
}
