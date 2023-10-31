package fu.swp.dorm_mnm.service.baseImpl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import fu.swp.dorm_mnm.model.Manager;
import fu.swp.dorm_mnm.model.News;
import fu.swp.dorm_mnm.repository.base.ManagerRepository;
import fu.swp.dorm_mnm.repository.base.NewsRepository;
import fu.swp.dorm_mnm.service.base.NewsService;
import fu.swp.dorm_mnm.util.ImageUtil;

@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsRepository newsRepository;

    @Autowired
    private ManagerRepository managerRepository;

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
        Pageable pageable = PageRequest.of(pageNo, 8, Sort.by(Sort.Direction.ASC, "createdAt"));
        return newsRepository.findAll(pageable);
    }

    @Override
    public Page<News> findAllByTitle(String title, int pageNo) {
        Pageable pageable = PageRequest.of(pageNo, 8, Sort.by(Sort.Direction.ASC, "createdAt"));
        return newsRepository.findByTitleContaining(title, pageable);
    }

    @Override
    public String createNews(MultipartFile file, Long managerId) {

        try {
            Optional<Manager> manager = managerRepository.findById(managerId);
            News news = newsRepository.save(News.builder()
                    .title(file.getOriginalFilename())
                    .category(file.getContentType())
                    .manager(manager.get())
                    .fileData(ImageUtil.compressImage(file.getBytes())).build());
            if (news != null) {
                return "file uploaded successfully : " + file.getOriginalFilename();
            }
            return null;
        } catch (Exception e) {
            return "error: " + e;
        }
    }

    @Override
    public byte[] downloadImage(Long newsId) {
        Optional<News> news = newsRepository.findById(newsId);
        byte[] fileData = ImageUtil.decompressImage(news.get().getFileData());
        return fileData;
    }

}
