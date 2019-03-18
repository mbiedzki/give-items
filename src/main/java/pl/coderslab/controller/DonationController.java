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
@SessionAttributes({"selectedItemId", "selectedProfileId", "selectedInstitutionId"})
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

    @RequestMapping("/add/1")
    public String createDonation1(Model model, HttpSession session) {

        return "redirect:/donation/add/2";
    }

    // add form 2 *******************************************************************************
    @GetMapping("/add/2")
    public String displayDonationForm2(Model model, HttpSession session) {

        return "donation2";
    }

    @RequestMapping("/add/2")
    public String createDonation2(Model model, HttpSession session) {

        return "redirect:/donation/add/3";
    }

    // add form 3 *******************************************************************************
    @GetMapping("/add/3")
    public String displayDonationForm3(Model model, HttpSession session) {

        return "donation3";
    }

    @RequestMapping("/add/3")
    public String createDonation3(Model model, HttpSession session) {

        return "redirect:/donation/add/4";
    }

    // add form 4 *******************************************************************************
    @GetMapping("/add/4")
    public String displayDonationForm4(Model model, HttpSession session) {

        return "donation4";
    }

    @RequestMapping("/add/4")
    public String createDonation4(Model model, HttpSession session) {

        return "redirect:/donation/add/5";
    }

    // add form 5 *******************************************************************************
    @GetMapping("/add/5")
    public String displayDonationForm5(Model model, HttpSession session) {

        return "donation5";
    }

    @RequestMapping("/add/5")
    public String createDonation5(Model model, HttpSession session) {

        return "redirect:/donation/add/6";
    }

    // add form 6 *******************************************************************************
    @GetMapping("/add/6")
    public String displayDonationForm6(Model model, HttpSession session) {

        return "donation6";
    }

    @RequestMapping("/add/6")
    public String createDonation6(Model model, HttpSession session) {

        return "redirect:/donation/add/7";
    }

    // add form 7 summary *******************************************************************************
    @GetMapping("/add/7")
    public String displayDonationForm7(Model model, HttpSession session) {
//wyczyść sesję !!!
        return "donation7";
    }


}