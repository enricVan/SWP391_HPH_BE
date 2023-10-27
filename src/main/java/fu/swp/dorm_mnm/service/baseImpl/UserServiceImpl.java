package fu.swp.dorm_mnm.service.baseImpl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.repository.base.GuardRepository;
import fu.swp.dorm_mnm.repository.base.UserRepository;
import fu.swp.dorm_mnm.service.base.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private GuardRepository guardRepository;

    @Override
    public Optional<User> findById(Long id) {
        return userRepository.findById(id);
    }

    @Override
    public User save(User news) {
        return userRepository.save(news);
    }

    @Override
    public void remove(Long id) {
        userRepository.deleteById(id);
    }

    @Override
    public Page<User> findAll(int pageNo) {
        Pageable pageable = PageRequest.of(pageNo, 8, Sort.by(Sort.Direction.ASC, "id"));
        return userRepository.findAll(pageable);
    }

}
