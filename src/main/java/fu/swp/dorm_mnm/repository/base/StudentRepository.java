package fu.swp.dorm_mnm.repository.base;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fu.swp.dorm_mnm.model.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {

     Optional<Student> findByUserId(Long userId);

     @Query(value = "SELECT s.* FROM student s " +
               "WHERE s.roll_number LIKE :rollNumber", nativeQuery = true)
     Optional<Student> findByRollNumber(String rollNumber);
}
