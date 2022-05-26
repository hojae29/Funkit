package com.funkit.controller.funding;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/funding")
public class FundingController {

    @RequestMapping("")
    public String funding(){
        return "/funding/funding";
    }
}
