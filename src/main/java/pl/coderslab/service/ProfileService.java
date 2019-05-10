package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.model.Profile;
import pl.coderslab.repository.ProfileRepository;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class ProfileService {
    @Autowired
    private ProfileRepository profileRepository;

    public void save(Profile profile) {
        profileRepository.save(profile);
    }

    public void delete(Long id) {
        profileRepository.delete(id);
    }

    public Profile findOne(Long id) {
        return profileRepository.findOne(id);
    }

    public List<Profile> findAll() {
        return profileRepository.findAll();
    }
}
