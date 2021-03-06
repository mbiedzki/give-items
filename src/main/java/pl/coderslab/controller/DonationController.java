package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import pl.coderslab.model.*;
import pl.coderslab.service.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping(path = "/donation", produces = "text/html; charset=UTF-8")
@SessionAttributes({"selectedItemId", "selectedProfileId", "selectedLocationId", "selectedInstitutionId",
        "selectedNumberOfBags", "noMatch", "donation", "selectedAddress", "selectedCity", "selectedZip", "selectedPhone",
        "selectedDate", "selectedTime", "selectedInfo"})
public class DonationController {
    @Autowired
    private DonationService donationService;
    @Autowired
    private LocationService locationService;
    @Autowired
    private ProfileService profileService;
    @Autowired
    private InstitutionService institutionService;
    @Autowired
    private ItemService itemService;

    // model attributes *******************************************************************************
    @ModelAttribute("locations")
    public List<Location> getLocations() {
        return locationService.findAll();
    }

    @ModelAttribute("profiles")
    public List<Profile> getProfiles() {
        return profileService.findAll();
    }

    @ModelAttribute("items")
    public List<Item> getItems() {
        return itemService.findAll();
    }

    @ModelAttribute("institutions")
    public List<Institution> getInstitutions() {
        return institutionService.findAll();
    }

    // add form 1 *******************************************************************************
    @GetMapping("/add/1")
    public String displayDonationForm1(Model model, HttpSession session) {

        return "donation1";
    }

    @PostMapping("/add/1")
    public String createDonation1(@RequestParam String chooseItem, Model model, HttpSession session) {
        model.addAttribute("selectedItemId", Long.parseLong(chooseItem));
        return "redirect:/donation/add/2";
    }

    // add form 2 *******************************************************************************
    @GetMapping("/add/2")
    public String displayDonationForm2(Model model, HttpSession session) {

        return "donation2";
    }

    @PostMapping("/add/2")
    public String createDonation2(@RequestParam String chooseBags, Model model, HttpSession session) {
        model.addAttribute("selectedNumberOfBags", Long.parseLong(chooseBags));
        return "redirect:/donation/add/3";
    }

    // add form 3 *******************************************************************************
    @GetMapping("/add/3")
    public String displayDonationForm3(Model model, HttpSession session) {

        return "donation3";
    }

    @PostMapping("/add/3")
    public String createDonation3(@RequestParam String chooseLocation, @RequestParam String chooseProfile, Model model, HttpSession session) {
        model.addAttribute("selectedLocationId", Long.parseLong(chooseLocation));
        model.addAttribute("selectedProfileId", Long.parseLong(chooseProfile));
        model.addAttribute("noMatch", false);
        return "redirect:/donation/add/4";
    }

    // add form 4 *******************************************************************************
    @GetMapping("/add/4")
    public String displayDonationForm4(Model model, HttpSession session) {
        Long locationId = (Long) session.getAttribute("selectedLocationId");
        Long profileId = (Long) session.getAttribute("selectedProfileId");

        //validation if no institution matches criteria
        if (institutionService.findByLocationAndProfile(locationId, profileId).size() == 0) {
            model.addAttribute("noMatch", true);
            return "donation4";
        }

        model.addAttribute("institutions", institutionService.findByLocationAndProfile(locationId, profileId));
        return "donation4";
    }

    @PostMapping("/add/4")
    public String createDonation4(@RequestParam String chooseInstitution, Model model, HttpSession session) {
        model.addAttribute("selectedInstitutionId", Long.parseLong(chooseInstitution));
        return "redirect:/donation/add/5";
    }

    // add form 5 *******************************************************************************
    @GetMapping("/add/5")
    public String displayDonationForm5(Model model, HttpSession session) {

        return "donation5";
    }

    @PostMapping("/add/5")
    public String createDonation5(@RequestParam String selAddress,
                                  @RequestParam String selCity,
                                  @RequestParam String selZip,
                                  @RequestParam String selPhone,
                                  @RequestParam String selDate,
                                  @RequestParam String selTime,
                                  @RequestParam String selInfo,
                                  Model model, HttpSession session) {

        model.addAttribute("selectedAddress", selAddress);
        model.addAttribute("selectedCity", selCity);
        model.addAttribute("selectedZip", selZip);
        model.addAttribute("selectedPhone", selPhone);
        model.addAttribute("selectedDate", selDate);
        model.addAttribute("selectedTime", selTime);
        model.addAttribute("selectedInfo", selInfo);


        Donation donation = new Donation();

        donation.setAddress(selAddress);
        donation.setCity(selCity);
        donation.setZip(selZip);
        donation.setPhone(selPhone);
        donation.setPickupDate(selDate);
        donation.setPickupTime(selTime);
        donation.setInfo(selInfo);
        donation.setItem(itemService.findOne((Long) session.getAttribute("selectedItemId")));
        donation.setProfile(profileService.findOne((Long) session.getAttribute("selectedProfileId")));
        donation.setNumberOfBags((Long) session.getAttribute("selectedNumberOfBags"));

        //check if there is matching institution
        if (!(boolean) session.getAttribute("noMatch")) {
            donation.setInstitution((Long) session.getAttribute("selectedInstitutionId"));
        }

        model.addAttribute("donation", donation);

        return "redirect:/donation/add/6";
    }

    // add form 6 *******************************************************************************
    @GetMapping("/add/6")
    public String displayDonationForm6(Model model, HttpSession session) {

        return "donation6";
    }

    @PostMapping("/add/6")
    public String createDonation6(@Valid Donation donation, Model model, HttpSession session, SessionStatus status) {
        donation.setUser((Long) session.getAttribute("userId"));
        donationService.save(donation);
        session.removeAttribute("selectedAddress");
        session.removeAttribute("selectedCity");
        session.removeAttribute("selectedZip");
        session.removeAttribute("selectedPhone");
        session.removeAttribute("selectedDate");
        session.removeAttribute("selectedTime");
        session.removeAttribute("selectedInfo");
        session.removeAttribute("selectedItemId");
        session.removeAttribute("selectedNumberOfBags");
        session.removeAttribute("selectedLocationId");
        session.removeAttribute("selectedProfileId");
        session.removeAttribute("noMatch");
        session.removeAttribute("selectedInstitutionId");
        session.removeAttribute("donation");
        status.setComplete();
        return "redirect:/donation/add/7";
    }

    // add form 7 summary *******************************************************************************
    @GetMapping("/add/7")
    public String displayDonationForm7(Model model, HttpSession session) {


        return "donation7";
    }


}