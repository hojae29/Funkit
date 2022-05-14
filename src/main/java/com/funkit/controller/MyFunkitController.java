package com.funkit.controller;

import com.funkit.exception.CustomException;
import com.funkit.exception.ErrorCode;
import com.funkit.model.Member;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/myfunkit")
public class MyFunkitController {

    @RequestMapping("/")
    public String myPage(HttpSession session){
        Member member = (Member) session.getAttribute("member");
        int type = member.getCode();

        if(type == 10)
            return "mypage/individual";
        else if(type == 20)
            return "mypage/company";
        else if(type == 30)
            return "mypage/manager";
        else
            throw new CustomException(ErrorCode.WRONG_ACCESS);
    }
}
