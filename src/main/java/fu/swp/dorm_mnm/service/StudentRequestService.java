package fu.swp.dorm_mnm.service;

import fu.swp.dorm_mnm.model.Semester;
import fu.swp.dorm_mnm.model.StudentRequest;

import java.util.Optional;

public interface StudentRequestService {
    Iterable<StudentRequest> findAll();

    Optional<StudentRequest> findById(Long id);

    StudentRequest save(StudentRequest studentRequest);

    void remove(Long id);
}
