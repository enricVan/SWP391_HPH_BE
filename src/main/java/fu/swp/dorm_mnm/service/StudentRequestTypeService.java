package fu.swp.dorm_mnm.service;

import fu.swp.dorm_mnm.model.StudentRequestType;

import java.util.Optional;

public interface StudentRequestTypeService {
    Iterable<StudentRequestType> findAll();

    Optional<StudentRequestType> findById(Long id);

    StudentRequestType save(StudentRequestType studentRequestType);

    void remove(Long id);
}
