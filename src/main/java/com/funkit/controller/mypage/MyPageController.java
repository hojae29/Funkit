package com.funkit.controller.mypage;

import com.funkit.exception.CustomException;
import com.funkit.exception.ErrorCode;
import com.funkit.model.Member;
import com.funkit.service.funding.FundingService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/myfunkit")
public class MyPageController {

    final FundingService fundingService;

    public MyPageController(FundingService fundingService) {
        this.fundingService = fundingService;
    }

    @RequestMapping("/")
    public String myPage(HttpSession session){
        Member member = (Member) session.getAttribute("member");
        int type = member.getTypeCode();

        switch(type){
            case 10 : {
                return "redirect:/myfunkit/individual";
            }
            case 20 : {
                return "redirect:/myfunkit/company";
            }
            case 30 : return "redirect:/mgr";
            default : throw new CustomException(ErrorCode.WRONG_ACCESS);
        }
    }
}
