package fu.swp.dorm_mnm.service.base;

import java.util.Optional;

import org.springframework.data.domain.Page;

import fu.swp.dorm_mnm.model.User;

public interface UserService {

    Optional<User> findById(Long id);

    User save(User news);

    void remove(Long id);

    Page<User> findAll(int pageNo);

}
