package com.funkit.controller.funding;

import com.funkit.exception.CustomException;
import com.funkit.exception.ErrorCode;
import com.funkit.model.Funding;
import com.funkit.model.Image;
import com.funkit.service.funding.FundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/funding")
public class FundingController {

    @Autowired
    FundingService fundingService;

    @RequestMapping("")
    public String funding(Model model){

        List<Funding<Image>> list = fundingService.getFundingList();
        for (var item : list)
            System.out.println(item);
        model.addAttribute("list", list);

        return "/funding/funding";
    }

    @RequestMapping("/{fundingCode}")
    public String moveFundingPage(@PathVariable int fundingCode, Model model){
        Funding<Image> funding = fundingService.getFundingByFundingCode(fundingCode);
        model.addAttribute("funding", funding);
        return "/funding/view";
    }

    @GetMapping("/{fundingCode}/order")
    public String moveFundingOrderPage(@PathVariable int fundingCode, Model model, int step){
        System.out.println(step);
        switch (step){
            case 1:
                return "/funding/order/step1";
            case 2:
                return "/funding/order/step2";
            case 3:
                return "/funding/order/step3";
            default:
                throw new CustomException(ErrorCode.WRONG_ACCESS);
        }
    }
}
