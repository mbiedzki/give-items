package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.User;
import pl.coderslab.service.DonationService;
import pl.coderslab.service.UserService;
import pl.coderslab.util.FileRead;
import pl.coderslab.util.Mailer;

import javax.servlet.http.HttpSession;

import static pl.coderslab.util.RandomAlphaString.randomAlphaNumeric;

@Controller
@RequestMapping(path = "/", produces = "text/html; charset=UTF-8")
public class HomeController {
    @Autowired
    private DonationService donationService;
    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String displayHome(Model model) {

        //here we will display index statistics: bags, etc

        return "index";
    }

    //password remind
    //*************************************************************************************************************

    @GetMapping("/remind")
    public String displayRemind() {
        return "remind";
    }

    @RequestMapping("/remind")
    public String remind(@RequestParam String inputEmail,
                         Model model, HttpSession session) {

        model.addAttribute("emptyError", false);
        model.addAttribute("emailSent", false);
        model.addAttribute("emailNotFound", false);

        //all fields must be filled in
        if(inputEmail.equals("")) {
            model.addAttribute("emptyError", true);
            return "remind";
        }

        User userToVerify = userService.findUserByEmail(inputEmail);

        //if email found in database
        if(userToVerify!=null) {

            //set password to: random
            String randomPassword = randomAlphaNumeric(8);
            userToVerify.setPassword(userService.encryptPassword(randomPassword));
            userService.save(userToVerify);
            //send email to inputEmail
            Mailer.send(inputEmail, "powiadomienie od aplikacji Oddaj Rzeczy",
                    "Twoje hasło zostało zmienione na : "+randomPassword + ", Pozdrawiamy.");
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
