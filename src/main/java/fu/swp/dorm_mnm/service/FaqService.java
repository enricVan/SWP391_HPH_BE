package fu.swp.dorm_mnm.service;

import fu.swp.dorm_mnm.model.FAQ;
import fu.swp.dorm_mnm.model.Role;

import java.util.Optional;

import org.springframework.stereotype.Service;

public interface FaqService {

    public Iterable<FAQ> findAll();

    public Optional<FAQ> findById(Long id);

    public FAQ save(FAQ faq);

    public void remove(Long id);
}
