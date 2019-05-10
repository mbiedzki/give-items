package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.*;
import pl.coderslab.service.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(path = "/user", produces = "text/html; charset=UTF-8")
public class UserController {
    @Autowired
    private UserService userService;
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


    //edit user profile *****************************************************************************************
    @GetMapping("/edit")
    public String displayUser(Model model, HttpSession session) {
        User userToEdit = userService.findOne((Long) session.getAttribute("userId"));
        model.addAttribute("fullName", userToEdit.getFullName());
        model.addAttribute("email", userToEdit.getEmail());
        return "userEdit";
    }

    @PostMapping("/edit")
    public String editUser(@RequestParam String fullName, @RequestParam String email,
                           @RequestParam String password, @RequestParam String password2,
                           Model model, HttpSession session) {

        model.addAttribute("emptyError", false);
        model.addAttribute("passwordError", false);
        model.addAttribute("duplicateEmailError", false);

        //fullName and email fields must be filled in
        if (email.equals("") || fullName.equals("")) {
            model.addAttribute("emptyError", true);
            model.addAttribute("email", email);
            model.addAttribute("fullname", fullName);
            return "userEdit";
        }

        //password strings must be identical
        if (!password.equals(password2)) {
            model.addAttribute("passwordError", true);
            model.addAttribute("email", email);
            model.addAttribute("password", "");
            model.addAttribute("password2", "");
            model.addAttribute("fullName", fullName);
            return "userEdit";
        }

        User userToEdit = userService.findOne((Long) session.getAttribute("userId"));
        userToEdit.setEmail(email);
        userToEdit.setFullName(fullName);

        //if password not empty and both passwords the same (checked earlier) setup password
        if (!password.equals("")) {
            userToEdit.setPassword(userService.encryptPassword(password));
        }

        userService.save(userToEdit);

        model.addAttribute("email", email);
        model.addAttribute("fullName", fullName);

        return "redirect:/donation/add/1";
    }

    //view user donations *****************************************************************************************
    @GetMapping("/donations")
    public String displayUserDonations(Model model, HttpSession session) {
        List<Donation> userDonations = donationService.findDonationsByUser((Long) session.getAttribute("userId"));
        model.addAttribute("userDonations", userDonations);
        return "userDonations";
    }


}
