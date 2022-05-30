package com.funkit.controller.funding;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import com.funkit.service.funding.FundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        model.addAttribute("list", list);

        return "/funding/funding";
    }
}
