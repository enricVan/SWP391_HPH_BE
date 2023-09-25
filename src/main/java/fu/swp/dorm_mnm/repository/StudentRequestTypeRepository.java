package fu.swp.dorm_mnm.repository;

import fu.swp.dorm_mnm.model.StudentRequestType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentRequestTypeRepository extends JpaRepository<StudentRequestType, Long> {

}
