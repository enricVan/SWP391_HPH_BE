package fu.swp.dorm_mnm.service.base;

import java.util.Optional;

import org.springframework.data.domain.Pageable;

import fu.swp.dorm_mnm.dto.PageDto;
import fu.swp.dorm_mnm.dto.base.BedRequestDto;
import fu.swp.dorm_mnm.model.BedRequest;

public interface BedRequestService {

    Iterable<BedRequest> findAll();

    Optional<BedRequest> findById(Long id);

    BedRequest save(BedRequest bedRequest, Long studentId);

    BedRequest save(BedRequest bedRequest);

    void remove(Long id);

    PageDto<BedRequestDto> findByUserId(String status, Long userId, Pageable pageable);
}
