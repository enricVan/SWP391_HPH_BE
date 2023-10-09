package fu.swp.dorm_mnm.service;

import fu.swp.dorm_mnm.model.Semester;
import java.util.Date;
import java.util.Optional;

public interface SemesterService {

    Iterable<Semester> findAll();

    Optional<Semester> findById(Long id);

    Semester save(Semester semester);

    void remove(Long id);

    Semester getNextSemester(Date currentDate);
}
