package com.funkit.controller.funding;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import com.funkit.service.funding.FundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        model.addAttribute("funding", fundingService.getFunding(fundingCode));
        return "/funding/view";
    }
}
