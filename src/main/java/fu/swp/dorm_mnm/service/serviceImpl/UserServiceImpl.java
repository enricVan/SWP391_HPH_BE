package fu.swp.dorm_mnm.service.serviceImpl;

import fu.swp.dorm_mnm.service.UserService;
import org.springframework.stereotype.Service;

import fu.swp.dorm_mnm.model.User;

@Service
public class UserServiceImpl implements UserService {

    @Override
    public User accountAuthentication(String username, String password) {
        throw new UnsupportedOperationException("Unimplemented method 'accountAuthentication'");
    }
    
}
