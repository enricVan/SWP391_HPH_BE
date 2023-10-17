package fu.swp.dorm_mnm.controller;

import fu.swp.dorm_mnm.dto.PenaltyTicketDto;
import fu.swp.dorm_mnm.model.PenaltyTicket;
import fu.swp.dorm_mnm.service.GuardService;
import fu.swp.dorm_mnm.service.PenaltyTicketService;
import fu.swp.dorm_mnm.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@RestController
@CrossOrigin(origins = "http://localhost:5173")
@RequestMapping("/api/v1/penalty-ticket")
@PreAuthorize("hasAnyRole('STUDENT', 'MANAGER', 'GUARD')")
public class PenaltyTicketController {

    @Autowired
    private PenaltyTicketService penaltyTicketService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private GuardService guardService;

    @PostMapping
    @PreAuthorize("hasAuthority('penalty-ticket:create')")
    public ResponseEntity<PenaltyTicket> createNewPenaltyTicket(@RequestBody PenaltyTicketDto penaltyTicketDto) {
        PenaltyTicket penaltyTicket = new PenaltyTicket();
        penaltyTicket.setPenaltyTicketId(penaltyTicketDto.getPenaltyTicketId());
        penaltyTicket.setStudent(studentService.findById(penaltyTicketDto.getStudentId()).get());
        penaltyTicket.setGuard(guardService.findById(penaltyTicketDto.getCreatedByGuardId()).get());
        penaltyTicket.setTitle(penaltyTicketDto.getTitle());
        penaltyTicket.setContent(penaltyTicketDto.getContent());
        penaltyTicket.setStatus(penaltyTicketDto.getStatus());
        penaltyTicket.setCreatedAt(new Date());
        penaltyTicket.setUpdatedAt(new Date());
        return new ResponseEntity<>(penaltyTicketService.save(penaltyTicket), HttpStatus.OK);
    }

    @GetMapping
    @PreAuthorize("hasAuthority('penalty-ticket:read')")
    public ResponseEntity<List<PenaltyTicketDto>> getAllPenaltyTicket() {
        List<PenaltyTicket> penaltyTickets = penaltyTicketService.findAll();
        List<PenaltyTicketDto> penaltyTicketDtos = new ArrayList<>();
        for (PenaltyTicket penaltyTicket : penaltyTickets
        ) {
            penaltyTicketDtos.add(new PenaltyTicketDto(penaltyTicket));
        }
        return new ResponseEntity<>(penaltyTicketDtos, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('penalty-ticket:read')")
    public ResponseEntity<PenaltyTicketDto> getPenaltyTicketById(@PathVariable Long id) {
        Optional<PenaltyTicket> penaltyTicketOptional = penaltyTicketService.findById(id);
        if (penaltyTicketOptional.isPresent()) {
            PenaltyTicket penaltyTicket = penaltyTicketOptional.get();
            return new ResponseEntity<>(new PenaltyTicketDto(penaltyTicket), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('penalty-ticket:update')")
    public ResponseEntity<PenaltyTicket> updateStatus(@PathVariable Long id, @RequestBody PenaltyTicket penaltyTicket) {
        Optional<PenaltyTicket> penaltyTicketOptional = penaltyTicketService.findById(id);
        if (penaltyTicketOptional.isPresent()) {
            PenaltyTicket penaltyTicketFinded = penaltyTicketOptional.get();
            penaltyTicketFinded.setStatus(penaltyTicket.getStatus());
            penaltyTicketService.save(penaltyTicketFinded);
            return new ResponseEntity<>(penaltyTicketFinded, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('penalty-ticket:delete')")
    public ResponseEntity<PenaltyTicket> deleteBedById(@PathVariable Long id) {
        Optional<PenaltyTicket> penaltyTicketOptional = penaltyTicketService.findById(id);
        return penaltyTicketOptional.map(penaltyTicket -> {
            penaltyTicketService.remove(id);
            return new ResponseEntity<>(penaltyTicket, HttpStatus.OK);
        }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }
}
