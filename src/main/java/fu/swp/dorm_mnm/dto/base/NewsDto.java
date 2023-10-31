package fu.swp.dorm_mnm.dto.base;

import fu.swp.dorm_mnm.model.News;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class NewsDto {

    private Long newsId;
    private Long managerId;
    private String category;
    private String title;
    private String content;
    private String fileName;
    private String createdAt;
    private String updatedAt;

    public NewsDto(News news) {
        this.newsId = news.getNewsId();
        this.managerId = news.getManager().getManagerId();
        this.category = news.getCategory();
        this.title = news.getTitle();
        this.content = news.getContent();
        this.fileName = news.getFileName();
        this.createdAt = news.getCreatedAt().toString();
        this.updatedAt = news.getCreatedAt().toString();
    }

}
