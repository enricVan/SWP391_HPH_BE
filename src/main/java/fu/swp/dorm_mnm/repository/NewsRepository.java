package fu.swp.dorm_mnm.repository;

import fu.swp.dorm_mnm.model.News;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
@Repository
public interface NewsRepository extends JpaRepository<News,Long> {
    Page<News> findByTitleContaining(String title, Pageable pageable);
}