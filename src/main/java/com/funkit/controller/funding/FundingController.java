package com.funkit.controller.funding;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import com.funkit.model.Tag;
import com.funkit.service.TagService;
import com.funkit.service.funding.FundingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @GetMapping("/{fundingCode}/order")
    public String moveStepOnePage(@PathVariable int fundingCode, Model model){

        var funding = fundingService.getFundingByFundingCode(fundingCode);
        model.addAttribute("funding", funding);

        return "/funding/order";
    }
}
