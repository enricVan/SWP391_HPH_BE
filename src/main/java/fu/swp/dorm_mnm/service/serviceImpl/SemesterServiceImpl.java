package fu.swp.dorm_mnm.service.serviceImpl;

import fu.swp.dorm_mnm.model.Semester;
import fu.swp.dorm_mnm.repository.SemesterRepository;
import fu.swp.dorm_mnm.service.SemesterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Optional;


@Service
public class SemesterServiceImpl implements SemesterService {

    @Autowired
    private SemesterRepository semesterRepository;
    @Override
    public Iterable<Semester> findAll() {
        return semesterRepository.findAll();
    }

    @Override
    public Optional<Semester> findById(Long id) {
        return semesterRepository.findById(id);
    }

    @Override
    public Semester save(Semester semester) {
        return semesterRepository.save(semester);
    }

    @Override
    public void remove(Long id) {
        semesterRepository.deleteById(id);
    }

    @Override
    public Semester getNextSemester(Date currentDate) {
        Optional<Semester> nextSemester = semesterRepository
                .findAll()
                .stream()
                .filter(semester -> semester.getStartDate().after(currentDate))
                .min((s1, s2) -> s1.getStartDate().compareTo(s2.getStartDate()));

        return nextSemester.orElse(null);
    }
}
