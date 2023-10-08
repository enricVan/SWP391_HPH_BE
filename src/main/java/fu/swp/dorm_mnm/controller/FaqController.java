package fu.swp.dorm_mnm.controller;

import fu.swp.dorm_mnm.model.FAQ;
import fu.swp.dorm_mnm.service.FaqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@CrossOrigin(origins = "http://localhost:5173")
@RequestMapping("/api/v1/admin/faq")
public class FaqController {

    @Autowired
    private FaqService faqService;

    @PostMapping
    public ResponseEntity<FAQ> createNewFAQ(@RequestBody FAQ faq) {
        return new ResponseEntity<>(faqService.save(faq), HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<Iterable<FAQ>> getAllFAQ() {
        return new ResponseEntity<>(faqService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<FAQ> getFaqById(@PathVariable Long id) {
        Optional<FAQ> faqOptional = faqService.findById(id);
        return faqOptional.map(faq -> new ResponseEntity<>(faq, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<FAQ> deleteFAQById(@PathVariable Long id) {
        Optional<FAQ> faqOptional = faqService.findById(id);
        return faqOptional.map(faq -> {
            faqService.remove(id);
            return new ResponseEntity<>(faq, HttpStatus.OK);
        }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }
}