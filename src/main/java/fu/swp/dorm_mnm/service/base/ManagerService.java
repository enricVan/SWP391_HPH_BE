package fu.swp.dorm_mnm.service.base;

import fu.swp.dorm_mnm.dto.PageDto;
import fu.swp.dorm_mnm.dto.base.ManagerDto;
import fu.swp.dorm_mnm.model.Manager;
import org.springframework.data.domain.Pageable;

public interface ManagerService {
    public PageDto<ManagerDto> findAll(Pageable pageable);
}
