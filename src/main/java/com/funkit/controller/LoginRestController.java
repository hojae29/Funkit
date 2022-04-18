package com.funkit.controller;

import com.funkit.model.Member;
import com.funkit.service.LoginService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class LoginRestController {

    final LoginService service;

    public LoginRestController(LoginService service) {
        this.service = service;
    }

    @PostMapping("/register")
    public ResponseEntity register(@RequestBody Member member){
        return service.register(member);
    }

    @GetMapping("/id-check")
    public ResponseEntity idCheck(@RequestParam String id) {
        return service.checkId(id);
    }
}

