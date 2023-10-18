package fu.swp.dorm_mnm.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.Objects;

@NoArgsConstructor
@Getter
@Setter
public class PageDto<T> {
    private int currentPage;
    private Long totalItems;
    private int totalPages;
    private List<T> data;
}
