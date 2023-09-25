package fu.swp.dorm_mnm.service.serviceImpl;

import fu.swp.dorm_mnm.model.RequestType;
import fu.swp.dorm_mnm.repository.RequestTypeRepository;
import fu.swp.dorm_mnm.service.RequestTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
@Service
public class RequestTypeServiceImpl implements RequestTypeService {

    @Autowired
    private RequestTypeRepository requestTypeRepository;
    @Override
    public Iterable<RequestType> findAll() {
        return requestTypeRepository.findAll();
    }

    @Override
    public Optional<RequestType> findById(Long id) {
        return requestTypeRepository.findById(id);
    }

    @Override
    public RequestType save(RequestType requestType) {
        return requestTypeRepository.save(requestType);
    }

    @Override
    public void remove(Long id) {
        requestTypeRepository.deleteById(id);
    }
}
