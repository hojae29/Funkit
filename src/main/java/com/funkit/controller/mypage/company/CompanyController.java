package com.funkit.controller.mypage.company;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import com.funkit.model.Member;
import com.funkit.service.funding.FundingService;
import com.funkit.util.Pager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/myfunkit/company")
public class CompanyController {

    final FundingService fundingService;

    public CompanyController(FundingService fundingService) {
        this.fundingService = fundingService;
    }

    @RequestMapping("")
    public String MyPage(HttpSession session, Model model, Pager pager){
        Member member = (Member) session.getAttribute("member");

        List<Funding<Image>> fundingList = fundingService.getFundingListById(member.getId(), pager);
        model.addAttribute("funding", fundingList);

        return "/mypage/company";
    }

}
