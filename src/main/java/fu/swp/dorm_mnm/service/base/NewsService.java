package fu.swp.dorm_mnm.service.base;

import fu.swp.dorm_mnm.model.News;
import org.springframework.data.domain.Page;

import java.util.Optional;

public interface NewsService {
    
    Optional<News> findById(Long id);

    News save(News news);

    void remove(Long id);

    Page<News> findAll(int pageNo);

    Page<News> findAllByTitle(String title, int pageNo);
}
