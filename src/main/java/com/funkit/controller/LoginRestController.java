package com.funkit.controller;

import com.funkit.model.Member;
import com.funkit.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoginRestController {

    final LoginService service;

    public LoginRestController(LoginService service) {
        this.service = service;
    }

    @PostMapping("/register")
    public String register(@RequestBody Member member){
        service.register(member);
        return "OK";
    }
}
