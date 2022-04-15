package com.funkit.controller;

import com.funkit.model.Member;
import com.funkit.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/id-check")
    public String idCheck(@RequestParam String id){
        return service.idCheck(id);
    }
}
