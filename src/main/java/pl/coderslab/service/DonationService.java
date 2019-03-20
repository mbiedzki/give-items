package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.model.Donation;
import pl.coderslab.repository.DonationRepository;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class DonationService {
    @Autowired
    private DonationRepository donationRepository;

    public void save(Donation donation) {
        donationRepository.save(donation);
    }

    public void delete(Long id) {
        donationRepository.delete(id);
    }

    public Donation findOne(Long id) {
        return donationRepository.findOne(id);
    }

    public List<Donation> findAll() {

        return donationRepository.findAll();
    }

    public List<Donation> findDonationsByUser(Long userId) {
        return donationRepository.findDonationsByUser(userId);
    }


}
