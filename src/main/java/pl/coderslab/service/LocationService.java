package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.model.Location;
import pl.coderslab.repository.LocationRepository;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class LocationService {
    @Autowired
    private LocationRepository locationRepository;

    public void save(Location location) {
        locationRepository.save(location);
    }

    public void delete(Long id) {
        locationRepository.delete(id);
    }

    public Location findOne(Long id) {
        return locationRepository.findOne(id);
    }

    public List<Location> findAll() {
        return locationRepository.findAll();
    }
}
