package fu.swp.dorm_mnm.service.baseImpl;

import fu.swp.dorm_mnm.model.News;
import fu.swp.dorm_mnm.repository.base.NewsRepository;
import fu.swp.dorm_mnm.service.base.NewsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Optional;
@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    NewsRepository newsRepository;
    @Override
    public Optional<News> findById(Long id) {
        return newsRepository.findById(id);
    }

    @Override
    public News save(News news) {
        return newsRepository.save(news);
    }

    @Override
    public void remove(Long id) {
        newsRepository.deleteById(id);
    }

    @Override
    public Page<News> findAll(int pageNo) {
        Pageable pageable=PageRequest.of(pageNo,8, Sort.by(Sort.Direction.ASC,"createdAt"));
        return newsRepository.findAll(pageable);
    }

    @Override
    public Page<News> findAllByTitle(String title, int pageNo) {
        Pageable pageable=PageRequest.of(pageNo,8,Sort.by(Sort.Direction.ASC,"createdAt"));
        return newsRepository.findByTitleContaining(title,pageable);
    }


}
