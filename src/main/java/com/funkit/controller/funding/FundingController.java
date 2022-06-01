package com.funkit.controller.funding;

import com.funkit.exception.CustomException;
import com.funkit.exception.ErrorCode;
import com.funkit.model.Funding;
import com.funkit.model.Image;
import com.funkit.model.PayInfo;
import com.funkit.model.Tag;
import com.funkit.service.TagService;
import com.funkit.service.funding.FundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/funding")
public class FundingController {

    final FundingService fundingService;
    final TagService tagService;

    public FundingController(FundingService fundingService, TagService tagService) {
        this.fundingService = fundingService;
        this.tagService = tagService;
    }

    @RequestMapping("")
    public String funding(Model model){

        List<Funding<Image>> fundingList = fundingService.getFundingList();
        List<Tag> tagList = tagService.getTagList();

        model.addAttribute("fundingList", fundingList);
        model.addAttribute("tagList", tagList);

        return "/funding/funding";
    }

    @RequestMapping("/{fundingCode}")
    public String moveFundingPage(@PathVariable int fundingCode, Model model){
        Funding<Image> funding = fundingService.getFundingByFundingCode(fundingCode);
        model.addAttribute("funding", funding);
        return "/funding/view";
    }

    @GetMapping("/{fundingCode}/order/step1")
    public String moveStepOnePage(@PathVariable int fundingCode, Model model){

        var funding = fundingService.getFundingByFundingCode(fundingCode);
        model.addAttribute("funding", funding);

        return "/funding/order/step1";
    }

    @PostMapping("/{fundingCode}/order/step1")
    public String moveStepTwoPage(@PathVariable int fundingCode, Model model, PayInfo payInfo){
        System.out.println(payInfo);

        var funding = fundingService.getFundingByFundingCode(fundingCode);
        model.addAttribute("funding", funding);
        model.addAttribute("payInfo", payInfo);

        return "redirect:step2";
    }

    @GetMapping("/{fundingCode}/order/step2")
    public String moveStepTwoPage(@PathVariable int fundingCode, Model model){

        return "/funding/order/step2";
    }
}
