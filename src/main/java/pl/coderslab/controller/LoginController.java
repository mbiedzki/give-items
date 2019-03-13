package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.User;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(produces = "text/html; charset=UTF-8")
@SessionAttributes({"passwordError", "emptyError", "userRegistered", "email", "password", "password2" })
public class LoginController {
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String displayLogin() {
        return "login";
    }

   @GetMapping("/register")
    public String displayRegister(Model model) {
        model.addAttribute("email", "");
        model.addAttribute("password", "");
        model.addAttribute("password2", "");
        return "register";
    }

    @RequestMapping("/register")
    public String register(@RequestParam String email, @RequestParam String password, @RequestParam String password2, Model model, HttpSession session) {
        if(email.equals("") || password.equals("") || password2.equals("")) {
            model.addAttribute("emptyError", true);
            model.addAttribute("email", email);
            model.addAttribute("password", password);
            model.addAttribute("password2", password2);
            return "redirect:/register";
        }

        if (!password.equals(password2)) {
            model.addAttribute("passwordError", true);
            model.addAttribute("email", email);
            return "redirect:/register";
        }

        //if email exists

        User userToRegister = new User();
        userToRegister.setEmail(email);
        userToRegister.setAdmin(false);
        userToRegister.setPassword(userService.encryptPassword(password));
        userService.save(userToRegister);
        model.addAttribute("userRegistered", true);


        return "redirect:/login";
    }

}
