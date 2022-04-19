package com.funkit.controller;

import com.funkit.model.JsonResponse;
import com.funkit.model.Member;
import com.funkit.service.LoginService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;

@RestController
public class LoginRestController {

    final LoginService service;

    public LoginRestController(LoginService service) {
        this.service = service;
    }

    @PostMapping("/register")
    public ResponseEntity register(@RequestBody @Valid Member member, BindingResult bindingResult){
        //Validation Error
        if(bindingResult.hasErrors()){
            HashMap<String, String> errorList = new HashMap<>();
            for(ObjectError e : bindingResult.getAllErrors())
                errorList.put(((FieldError)e).getField(), e.getDefaultMessage());

            return new JsonResponse<>(HttpStatus.BAD_REQUEST, "Validation Error", errorList)
                    .toResponseEntity();
        }
        return service.register(member);
    }

    @GetMapping("/id-check")
    public ResponseEntity idCheck(@RequestParam String id) {
        return service.checkId(id);
    }
}

