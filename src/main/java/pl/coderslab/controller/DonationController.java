package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.*;
import pl.coderslab.service.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping(path="/donation", produces = "text/html; charset=UTF-8")
@SessionAttributes({"selectedItemId", "selectedProfileId", "selectedLocationId", "selectedInstitutionId",
        "numberOfBags", "noMatch", "donation", "address", "city", "zip", "phone", "date", "time", "info"})
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

    // add form 1 *******************************************************************************
    @GetMapping("/add/1")
    public String displayDonationForm1(Model model, HttpSession session) {

        return "donation1";
    }

    @RequestMapping("/add/1")
    public String createDonation1(@RequestParam String chooseItem, Model model, HttpSession session) {
        model.addAttribute("selectedItemId", Long.parseLong(chooseItem));
        return "redirect:/donation/add/2";
    }

    // add form 2 *******************************************************************************
    @GetMapping("/add/2")
    public String displayDonationForm2(Model model, HttpSession session) {

        return "donation2";
    }

    @RequestMapping("/add/2")
    public String createDonation2(@RequestParam String chooseBags, Model model, HttpSession session) {
        model.addAttribute("numberOfBags", Long.parseLong(chooseBags));
        return "redirect:/donation/add/3";
    }

    // add form 3 *******************************************************************************
    @GetMapping("/add/3")
    public String displayDonationForm3(Model model, HttpSession session) {

        return "donation3";
    }

    @RequestMapping("/add/3")
    public String createDonation3(@RequestParam String chooseLocation, @RequestParam String chooseProfile, Model model, HttpSession session) {
        model.addAttribute("selectedLocationId", Long.parseLong(chooseLocation));
        model.addAttribute("selectedProfileId", Long.parseLong(chooseProfile));
        model.addAttribute("noMatch", false );
        return "redirect:/donation/add/4";
    }

    // add form 4 *******************************************************************************
    @GetMapping("/add/4")
    public String displayDonationForm4(Model model, HttpSession session) {
        Long locationId = (Long) session.getAttribute("selectedLocationId");
        Long profileId = (Long) session.getAttribute("selectedProfileId");

        //validation if no institution matches criteria
        if(institutionService.findByLocationAndProfile(locationId, profileId).size()==0) {
            model.addAttribute("noMatch", true );
            return "donation4";
        }

        model.addAttribute("institutions", institutionService.findByLocationAndProfile(locationId, profileId));
        return "donation4";
    }

    @RequestMapping("/add/4")
    public String createDonation4(@RequestParam String chooseInstitution, Model model, HttpSession session) {
        model.addAttribute("selectedInstitutionId", Long.parseLong(chooseInstitution));
        return "redirect:/donation/add/5";
    }

    // add form 5 *******************************************************************************
    @GetMapping("/add/5")
    public String displayDonationForm5(Model model, HttpSession session) {

        return "donation5";
    }

    @RequestMapping("/add/5")
    public String createDonation5(@RequestParam String selAddress,
                                  @RequestParam String selCity,
                                  @RequestParam String selZip,
                                  @RequestParam String selPhone,
                                  @RequestParam String selDate,
                                  @RequestParam String selTime,
                                  @RequestParam String selInfo,
                                  Model model, HttpSession session) {

        model.addAttribute("address", selAddress);
        model.addAttribute("city", selCity);
        model.addAttribute("zip", selZip);
        model.addAttribute("phone", selPhone);
        model.addAttribute("date", selDate);
        model.addAttribute("time", selTime);
        model.addAttribute("info", selInfo);



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
        donation.setNumberOfBags((Long) session.getAttribute("numberOfBags"));

        //check if there is matching institution

        donation.setInstitution(institutionService.findOne((Long) session.getAttribute("selectedInstitutionId")));


        model.addAttribute("donation", donation);

        return "redirect:/donation/add/6";
    }

    // add form 6 *******************************************************************************
    @GetMapping("/add/6")
    public String displayDonationForm6(Model model, HttpSession session) {

        return "donation6";
    }

    @RequestMapping("/add/6")
    public String createDonation6(@Valid Donation donation, Model model, HttpSession session) {
        donationService.save(donation);
        return "redirect:/donation/add/7";
    }

    // add form 7 summary *******************************************************************************
    @GetMapping("/add/7")
    public String displayDonationForm7(Model model, HttpSession session) {

        model.addAttribute("address", "");
        model.addAttribute("city", "");
        model.addAttribute("zip", "");
        model.addAttribute("phone", "");
        model.addAttribute("date", "");
        model.addAttribute("time", "");
        model.addAttribute("info", "");
        model.addAttribute("selectedItemId", "");
        model.addAttribute("numberOfBags", "");
        model.addAttribute("selectedLocationId", "");
        model.addAttribute("selectedProfileId", "");
        model.addAttribute("noMatch", false );
        model.addAttribute("selectedInstitutionId", "");
        model.addAttribute("donation", "");

        return "donation7";
    }


}