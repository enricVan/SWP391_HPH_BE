package fu.swp.dorm_mnm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fu.swp.dorm_mnm.model.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long>{
    // Student findByUserId(Long userId);
}
