package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(path = "/", produces = "text/html; charset=UTF-8")
public class HomeController {

    @GetMapping("/")
    public String displayHome() {
        return "index";
    }


}
