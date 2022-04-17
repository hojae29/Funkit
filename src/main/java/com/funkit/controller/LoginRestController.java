package com.funkit.controller;

import com.funkit.exception.AlreadyExistEmailException;
import com.funkit.model.Member;
import com.funkit.model.DefaultResponse;
import com.funkit.service.LoginService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class LoginRestController {

    final LoginService service;

    public LoginRestController(LoginService service) {
        this.service = service;
    }

    @PostMapping("/register")
    public ResponseEntity<DefaultResponse<?>> register(@RequestBody Member member){
        return service.register(member);
    }

    @GetMapping("/id-check")
    public ResponseEntity<String> idCheck(@RequestParam String id){
        return service.checkId(id);
    }

    @ExceptionHandler(AlreadyExistEmailException.class)
    public ResponseEntity<DefaultResponse<?>> handleAlreadyExistEmail(AlreadyExistEmailException ex) {
        var res = new DefaultResponse<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage());
        return new ResponseEntity<>(res, HttpStatus.BAD_REQUEST);
    }
}

