package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.User;
import pl.coderslab.service.UserService;
import pl.coderslab.util.BCrypt;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(produces = "text/html; charset=UTF-8")
@SessionAttributes({"userId", "admin", "email"})
public class LoginController {
    @Autowired
    private UserService userService;


    //login
    //*************************************************************************************************************

    @GetMapping("/login")
    public String displayLogin() {
        return "login";
    }

    @RequestMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, Model model, HttpSession session) {

        model.addAttribute("loginError", false);
        model.addAttribute("emptyError", false);

        //all fields must be filled in
        if(email.equals("") || password.equals("")) {
            model.addAttribute("emptyError", true);
            model.addAttribute("email", email);
            model.addAttribute("password", password);
            return "login";
        }

        User userToVerify = userService.findUserByEmail(email);

        //if email not found in database -> login error
        if(userToVerify==null) {
            model.addAttribute("loginError", true);
            model.addAttribute("email", email);
            model.addAttribute("password", password);
            return "login";
        }

        //if password does not match -> login error
        if (!BCrypt.checkpw(password, userToVerify.getPassword())) {
            model.addAttribute("loginError", true);
            model.addAttribute("email", email);
            model.addAttribute("password", password);
            return "login";
        }

        //if email and password match
        model.addAttribute("admin", userToVerify.isAdmin());
        model.addAttribute("userId", userToVerify.getId());
        model.addAttribute("email", userToVerify.getEmail());
        return "redirect:/donation/add";
    }



    //registration
    //*************************************************************************************************************

   @GetMapping("/register")
    public String displayRegister() {
        return "register";
    }

    @RequestMapping("/register")
    public String register(@RequestParam String email, @RequestParam String password, @RequestParam String password2, Model model, HttpSession session) {

        model.addAttribute("emptyError", false);
        model.addAttribute("passwordError", false);
        model.addAttribute("duplicateEmailError", false);

        //all fields must be filled in
        if(email.equals("") || password.equals("") || password2.equals("")) {
            model.addAttribute("emptyError", true);
            model.addAttribute("email", email);
            model.addAttribute("password", password);
            model.addAttribute("password2", password2);
            return "register";
        }

        //password strings must be identical
        if (!password.equals(password2)) {
            model.addAttribute("passwordError", true);
            model.addAttribute("email", email);
            model.addAttribute("password", "");
            model.addAttribute("password2", "");
            return "register";
        }

        //email must be unique from existing in database
        if(userService.findUserByEmail(email)!=null) {
            model.addAttribute("duplicateEmailError", true);
            model.addAttribute("email", email);
            model.addAttribute("password", password);
            model.addAttribute("password2", password2);
            return "register";
        }

        User userToRegister = new User();
        userToRegister.setEmail(email);
        userToRegister.setAdmin(false);
        userToRegister.setPassword(userService.encryptPassword(password));
        userService.save(userToRegister);

        return "redirect:/login";
    }

}
