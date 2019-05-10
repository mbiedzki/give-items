package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import pl.coderslab.model.User;
import pl.coderslab.service.UserService;
import pl.coderslab.util.BCrypt;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(produces = "text/html; charset=UTF-8")
@SessionAttributes({"userId", "admin", "email", "fullName"})
public class LoginController {
    @Autowired
    private UserService userService;


    //login
    //*************************************************************************************************************

    @GetMapping("/login")
    public String displayLogin() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String inputEmail, @RequestParam String inputPassword,
                        Model model, HttpSession session) {

        model.addAttribute("loginError", false);
        model.addAttribute("emptyError", false);

        //all fields must be filled in
        if (inputEmail.equals("") || inputPassword.equals("")) {
            model.addAttribute("emptyError", true);
            model.addAttribute("email", inputEmail);
            model.addAttribute("password", inputPassword);
            return "login";
        }

        User userToVerify = userService.findUserByEmail(inputEmail);

        //if email not found in database -> login error
        if (userToVerify == null) {
            model.addAttribute("loginError", true);
            model.addAttribute("email", inputEmail);
            model.addAttribute("password", inputPassword);
            return "login";
        }

        //if password does not match -> login error
        if (!BCrypt.checkpw(inputPassword, userToVerify.getPassword())) {
            model.addAttribute("loginError", true);
            model.addAttribute("email", inputEmail);
            model.addAttribute("password", inputPassword);
            return "login";
        }

        //if email and password match
        model.addAttribute("admin", userToVerify.isAdmin());
        model.addAttribute("userId", userToVerify.getId());
        model.addAttribute("email", userToVerify.getEmail());
        model.addAttribute("fullName", userToVerify.getFullName());
        return "redirect:/donation/add/1";
    }


    //registration
    //*************************************************************************************************************

    @GetMapping("/register")
    public String displayRegister() {
        return "register";
    }

    @PostMapping("/register")
    public String register(@RequestParam String email, @RequestParam String password, @RequestParam String password2,
                           @RequestParam String fullName, Model model, HttpSession session, SessionStatus status) {

        model.addAttribute("emptyError", false);
        model.addAttribute("passwordError", false);
        model.addAttribute("duplicateEmailError", false);

        //all fields must be filled in
        if (email.equals("") || password.equals("") || password2.equals("") || fullName.equals("")) {
            model.addAttribute("emptyError", true);
            model.addAttribute("email", email);
            model.addAttribute("password", password);
            model.addAttribute("password2", password2);
            model.addAttribute("fullname", fullName);
            return "register";
        }

        //password strings must be identical
        if (!password.equals(password2)) {
            model.addAttribute("passwordError", true);
            model.addAttribute("email", email);
            model.addAttribute("password", "");
            model.addAttribute("password2", "");
            model.addAttribute("fullName", fullName);
            return "register";
        }

        //email must be unique from existing in database
        if (userService.findUserByEmail(email) != null) {
            model.addAttribute("duplicateEmailError", true);
            model.addAttribute("email", email);
            model.addAttribute("password", password);
            model.addAttribute("password2", password2);
            model.addAttribute("fullName", fullName);
            return "register";
        }

        User userToRegister = new User();
        userToRegister.setEmail(email);
        userToRegister.setFullName(fullName);
        userToRegister.setAdmin(false);
        userToRegister.setPassword(userService.encryptPassword(password));
        userService.save(userToRegister);

        session.removeAttribute("email");
        session.removeAttribute("userId");
        session.removeAttribute("admin");
        session.removeAttribute("fullName");
        status.setComplete();
        session.invalidate();

        return "redirect:/login";
    }

    //logout
    //*************************************************************************************************************

    @GetMapping("/logout")
    public String displayLogout(HttpSession session, SessionStatus status) {

        session.removeAttribute("email");
        session.removeAttribute("userId");
        session.removeAttribute("admin");
        session.removeAttribute("fullName");
        status.setComplete();
        session.invalidate();

        return "redirect:/";
    }


}
