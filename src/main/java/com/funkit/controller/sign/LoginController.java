package com.funkit.controller.sign;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();

        return "redirect:.";
    }
}
