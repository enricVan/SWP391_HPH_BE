package fu.swp.dorm_mnm.service.serviceImpl;

import fu.swp.dorm_mnm.model.PenaltyTicket;
import fu.swp.dorm_mnm.model.Semester;
import fu.swp.dorm_mnm.repository.PenaltyTicketRepository;
import fu.swp.dorm_mnm.service.PenaltyTicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PenaltyTicketServiceImpl implements PenaltyTicketService {

    @Autowired
    private PenaltyTicketRepository penaltyTicketRepository;

    @Override
    public List<PenaltyTicket> findAll() {
        return penaltyTicketRepository.findAll();
    }

    @Override
    public Optional<PenaltyTicket> findById(Long id) {
        return penaltyTicketRepository.findById(id);
    }

    @Override
    public PenaltyTicket save(PenaltyTicket penaltyTicket) {
        return penaltyTicketRepository.save(penaltyTicket);
    }

    @Override
    public void remove(Long id) {
        penaltyTicketRepository.deleteById(id);
    }
}
