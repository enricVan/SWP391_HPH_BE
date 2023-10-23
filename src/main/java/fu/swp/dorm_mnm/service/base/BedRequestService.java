package fu.swp.dorm_mnm.service.base;

import fu.swp.dorm_mnm.dto.base.BedRequestDto;
import fu.swp.dorm_mnm.dto.base.PageDto;
import fu.swp.dorm_mnm.model.BedRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;


public interface BedRequestService {

    Iterable<BedRequest> findAll();

    Optional<BedRequest> findById(Long id);

    BedRequest save(BedRequest bedRequest);

    void remove(Long id);
    PageDto<BedRequestDto> findByUserId(String status, Long userId, Pageable pageable);
}
