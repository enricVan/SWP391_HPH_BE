package fu.swp.dorm_mnm.service.base;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

import fu.swp.dorm_mnm.model.News;

public interface NewsService {

    Optional<News> findById(Long id);

    News save(News news);

    void remove(Long id);

    Page<News> findAll(int pageNo);

    Page<News> findAllByTitle(String title, int pageNo);

    public String createNews(MultipartFile file, Long mangerId);

    public byte[] downloadImage(Long newsId);
}
