package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.model.Institution;
import pl.coderslab.repository.InstitutionRepository;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class InstitutionService {
    @Autowired
    private InstitutionRepository institutionRepository;

    public void save(Institution institution) {institutionRepository.save(institution); }

    public void delete(Long id) {
        institutionRepository.delete(id);
    }

    public Institution findOne(Long id) {
        return institutionRepository.findOne(id);
    }

    public List<Institution> findAll() { return institutionRepository.findAll(); }

}
