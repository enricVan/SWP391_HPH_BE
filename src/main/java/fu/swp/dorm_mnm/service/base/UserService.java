package fu.swp.dorm_mnm.service.base;

import fu.swp.dorm_mnm.model.Guard;
import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.model.User;
import org.springframework.data.domain.Page;

import java.util.Optional;

public interface UserService {
    
    Optional<User> findById(Integer id);

    User save(User news);

    void remove(Integer id);

    Page<User> findAll(int pageNo);

}
