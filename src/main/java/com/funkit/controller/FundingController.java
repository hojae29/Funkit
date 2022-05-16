package com.funkit.controller;

import com.funkit.model.Funding;
import com.funkit.model.Member;
import com.funkit.service.FundingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/myfunkit/funding")
public class FundingController {

    final FundingService fundingService;

    public FundingController(FundingService fundingService) {
        this.fundingService = fundingService;
    }

    @RequestMapping("/make")
    public String makeFunding(HttpSession session){
        Member member = (Member)session.getAttribute("member");
        var funding = new Funding();
        funding.setId(member.getId());
        int code = fundingService.makeFunding(funding);
        return "redirect:./" + code;
    }

    @GetMapping("/{code}")
    public String moveFundingPage(@PathVariable int code, Model model){
        model.addAttribute("code", code);
        return "/mypage/funding/add";
    }
}

