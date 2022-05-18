package com.funkit.controller;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import com.funkit.model.Member;
import com.funkit.service.FundingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

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

        try{
            new File("d:/upload/" + code).mkdirs();
            new File("d:/upload/" + code + "/mainImage").mkdir();
            new File("d:/upload/" + code + "/fundingImage").mkdir();
        } catch(Exception e){
            e.getStackTrace();
        }

        return "redirect:./" + code;
    }

    @GetMapping("/{code}")
    public String moveFundingPage(@PathVariable int code, Model model){
        Funding<Image> funding = fundingService.getFunding(code);
        model.addAttribute("funding", funding);
        return "/mypage/funding/add";
    }

    @PostMapping("/{code}")
    public void saveFunding(@PathVariable int code, Funding<MultipartFile> funding, @RequestParam("deleteImages") List<String> deleteImages){
        funding.setFundingCode(code);

        System.out.println("가나다 : " + funding);
        fundingService.saveFunding(funding, deleteImages);

    }
}