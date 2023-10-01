package fu.swp.dorm_mnm.service.serviceImpl;

import fu.swp.dorm_mnm.model.FAQ;
import fu.swp.dorm_mnm.repository.FaqRepository;
import fu.swp.dorm_mnm.service.FaqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class FaqServiceImpl implements FaqService {
    @Autowired
    private FaqRepository faqRepository;
    @Override
    public Iterable<FAQ> findAll() {
        return faqRepository.findAll();
    }

    @Override
    public Optional<FAQ> findById(Long id) {
        return faqRepository.findById(id);
    }

    @Override
    public FAQ save(FAQ faq) {
        return faqRepository.save(faq);
    }

    @Override
    public void remove(Long id) {
        faqRepository.deleteById(id);
    }
}
