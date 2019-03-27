package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.Institution;
import pl.coderslab.model.User;
import pl.coderslab.service.DonationService;
import pl.coderslab.service.InstitutionService;
import pl.coderslab.service.UserService;
import pl.coderslab.util.FileRead;
import pl.coderslab.util.Mailer;

import javax.servlet.http.HttpSession;

import java.util.List;

import static pl.coderslab.util.RandomAlphaString.randomAlphaNumeric;

@Controller
@RequestMapping(path = "/", produces = "text/html; charset=UTF-8")
@SessionAttributes({"emptyError", "emailSent", "messFullName", "messEmail", "messText"})
public class HomeController {
    @Autowired
    private DonationService donationService;
    @Autowired
    private UserService userService;
    @Autowired
    private InstitutionService institutionService;

    @ModelAttribute("institutions")
    public List<Institution> getInstitutions() {
        return institutionService.findAll();
    }

    //index page
    //*************************************************************************************************************
    @GetMapping("/")
    public String displayHome(Model model) {

        //here we will display index statistics: bags, etc
        model.addAttribute("donatedBags", donationService.donatedBags());
        model.addAttribute("donatedInstitutions", donationService.donatedInstitutions());

        return "index";
    }

    @PostMapping("/")
    public String sendMessage(Model model, @RequestParam String messageFullName, @RequestParam String messageEmail,
                              @RequestParam String messageText) {

        model.addAttribute("emptyError", false);
        model.addAttribute("emailSent", false);

        //all fields must be filled in
        if (messageEmail.equals("") || messageFullName.equals("") || messageText.equals("")) {
            model.addAttribute("emptyError", true);
            model.addAttribute("messFullName", messageFullName);
            model.addAttribute("messEmail", messageEmail);
            model.addAttribute("messText", messageText);
            return "redirect:/#contact";
        }

        //send email to app owner
        Mailer.send("mbiedzki@me.com", "wiadomość w aplikacji Oddaj Rzeczy",
                "Wiadomość od : " + messageFullName + " , " + messageEmail + "\n\n" + messageText);
        model.addAttribute("emptyError", false);
        model.addAttribute("emailSent", true);
        model.addAttribute("messFullName", "");
        model.addAttribute("messEmail", "");
        model.addAttribute("messText", "");

        return "redirect:/#contact";
    }


    //password remind
    //*************************************************************************************************************

    @GetMapping("/remind")
    public String displayRemind() {
        return "remind";
    }

    @PostMapping("/remind")
    public String remind(@RequestParam String inputEmail,
                         Model model, HttpSession session) {

        model.addAttribute("emptyError", false);
        model.addAttribute("emailSent", false);
        model.addAttribute("emailNotFound", false);

        //all fields must be filled in
        if (inputEmail.equals("")) {
            model.addAttribute("emptyError", true);
            return "remind";
        }

        User userToVerify = userService.findUserByEmail(inputEmail);

        //if email found in database
        if (userToVerify != null) {

            //set password to: random
            String randomPassword = randomAlphaNumeric(8);
            userToVerify.setPassword(userService.encryptPassword(randomPassword));
            userService.save(userToVerify);
            //send email to inputEmail
            Mailer.send(inputEmail, "powiadomienie od aplikacji Oddaj Rzeczy",
                    "Twoje hasło zostało zmienione na : " + randomPassword + ", Pozdrawiamy.");
            model.addAttribute("emptyError", false);
            model.addAttribute("emailSent", true);
            model.addAttribute("emailNotFound", false);
            return "remind";

        }
        model.addAttribute("emptyError", false);
        model.addAttribute("emailSent", false);
        model.addAttribute("emailNotFound", true);
        return "remind";
    }


}
