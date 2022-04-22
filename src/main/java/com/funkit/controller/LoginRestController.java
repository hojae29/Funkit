package com.funkit.controller;

import com.funkit.model.JsonResponse;
import com.funkit.model.Member;
import com.funkit.service.LoginService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Random;

@RestController
public class LoginRestController {

    final LoginService service;
    final JavaMailSender mailSender;

    public LoginRestController(LoginService service, JavaMailSender mailSender) {
        this.service = service;
        this.mailSender = mailSender;
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

    @GetMapping("/mail-check")
    public void mailCheck(@RequestParam String email, HttpServletResponse response){
        Random random = new Random();
        int checkNum = random.nextInt(88888) + 11111;

        String subject = "Funkit 인증번호";
        String content = "Funkit 회원가입 이메일 인증번호" + "<br><br>" + checkNum;
        String from = "Funkit";
        String to = email;

        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);

            mailSender.send(mail);

        } catch(Exception e) {
            e.printStackTrace();
        }

        Cookie cookie = new Cookie("token", Integer.toString(checkNum));
        cookie.setMaxAge(3 * 60);
        response.addCookie(cookie);
    }
}

