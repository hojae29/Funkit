package com.funkit.controller.mypage.company;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import com.funkit.model.Member;
import com.funkit.service.funding.FundingService;
import com.funkit.service.funding.RewardService;
import com.funkit.util.Pager;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/myfunkit/company/funding")
public class CompanyFundingController {

    final FundingService fundingService;
    final RewardService rewardService;

    public CompanyFundingController(FundingService fundingService, RewardService rewardService) {
        this.fundingService = fundingService;
        this.rewardService = rewardService;
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
            new File("d:/upload/" + code + "/infoImage").mkdir();
        } catch(Exception e){
            e.getStackTrace();
        }

        return "redirect:./" + code;
    }

    @GetMapping("/{code}")
    public String moveMakeFundingPage(@PathVariable int code, Model model){
        Funding<Image> funding = fundingService.getFundingByFundingCode(code);
        model.addAttribute("funding", funding);
        return "/mypage/funding/add";
    }

    @PostMapping("/{code}")
    public void saveFunding(@PathVariable int code, Funding<MultipartFile> funding){
        funding.setFundingCode(code);

        System.out.println("funding  : " + funding);
        fundingService.saveFunding(funding);
    }

    @DeleteMapping("/{code}")
    public ResponseEntity deleteFunding(@PathVariable int code){
        return fundingService.deleteFunding(code);
    }

    @RequestMapping("/{code}/approval")
    public String fundingApprovalReq(@PathVariable int code, @RequestParam("status") int status){
        fundingService.fundingApprovalReq(code, status);

        return "redirect:/myfunkit/company";
    }

    @ResponseBody
    @GetMapping("")
    public Map pagination(HttpSession session, Pager pager){
        System.out.println(pager);

        Member member = (Member) session.getAttribute("member");

        List<Funding<Image>> fundingList = fundingService.getFundingListById(member.getId(), pager);

        Map map = new HashMap();
        map.put("list", fundingList);
        map.put("pager", pager);

        return map;
    }


}