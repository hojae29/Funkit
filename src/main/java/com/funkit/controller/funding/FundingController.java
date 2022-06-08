package com.funkit.controller.funding;

import com.funkit.model.*;
import com.funkit.service.TagService;
import com.funkit.service.funding.FundingService;
import com.funkit.service.funding.OrderService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/funding")
public class FundingController {

    final FundingService fundingService;
    final TagService tagService;
    final OrderService orderService;

    public FundingController(FundingService fundingService, TagService tagService, OrderService orderService) {
        this.fundingService = fundingService;
        this.tagService = tagService;
        this.orderService = orderService;
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
        int userCount = fundingService.getFundingUserCount(fundingCode);

        model.addAttribute("funding", funding);
        model.addAttribute("userCount", userCount);
        return "/funding/view";
    }

    @GetMapping("/{fundingCode}/order")
    public String moveOrderPage(@PathVariable int fundingCode, Model model){

        var funding = fundingService.getFundingByFundingCode(fundingCode);
        model.addAttribute("funding", funding);

        return "/funding/order";
    }

    @ResponseBody
    @PostMapping("/{fundingCode}/order")
    public ResponseEntity addOrder(@PathVariable int fundingCode, @RequestBody PayInfo payInfo, HttpSession session){
        Member member = (Member) session.getAttribute("member");
        payInfo.setId(member.getId());
        payInfo.setFundingCode(fundingCode);

        return orderService.addOrder(payInfo);
    }
}
