package com.funkit.controller.mypage;

import com.funkit.exception.CustomException;
import com.funkit.exception.ErrorCode;
import com.funkit.model.Funding;
import com.funkit.model.Image;
import com.funkit.model.Member;
import com.funkit.service.mypage.company.FundingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/myfunkit")
public class MyPageController {

    final FundingService fundingService;

    public MyPageController(FundingService fundingService) {
        this.fundingService = fundingService;
    }

    @RequestMapping("/")
    public String myPage(HttpSession session, Model model){
        Member member = (Member) session.getAttribute("member");
        int type = member.getCode();

        switch(type){
            case 10 : {
                return "mypage/individual";
            }
            case 20 : {
                List<Funding<Image>> fundingList = fundingService.getFundingList(member.getId());
                model.addAttribute("funding", fundingList);
                return "mypage/company";
            }
            case 30 : return "mypage/manager";
            default : throw new CustomException(ErrorCode.WRONG_ACCESS);
        }
    }
}