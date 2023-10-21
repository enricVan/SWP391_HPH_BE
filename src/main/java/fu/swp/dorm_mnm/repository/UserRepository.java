package fu.swp.dorm_mnm.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;

import fu.swp.dorm_mnm.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    Optional<User> findByUsername(String username);

    Optional<User> findByEmail(String email);

    Page<User> findByUsernameContaining(String partialUsername, Pageable pageable);

    // @PreAuthorize("hasAuthority('user:read')")
    // @Override
    // default List<User> findAll() {
    //     // TODO Auto-generated method stub
    //     throw new UnsupportedOperationException("Unimplemented method 'findAll'");
    // }
}
