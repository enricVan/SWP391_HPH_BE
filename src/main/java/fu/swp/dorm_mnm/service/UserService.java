package fu.swp.dorm_mnm.service;

import fu.swp.dorm_mnm.model.User;

import java.util.Optional;

public interface UserService {
    User accountAuthentication(String username, String password);

}
