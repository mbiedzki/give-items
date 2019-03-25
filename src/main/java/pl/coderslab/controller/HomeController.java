package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.service.DonationService;

@Controller
@RequestMapping(path = "/", produces = "text/html; charset=UTF-8")
public class HomeController {
    @Autowired
    private DonationService donationService;

    @GetMapping("/")
    public String displayHome(Model model) {



        return "index";
    }


}
