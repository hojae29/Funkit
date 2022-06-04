package com.funkit.controller.mypage.individual;

import com.funkit.service.funding.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/myfunkit/individual")
public class IndividualController {

    final OrderService orderService;

    public IndividualController(OrderService orderService) {
        this.orderService = orderService;
    }

    @RequestMapping("/funding")
    public String myPage(){
        return "/mypage/individual";
    }
}
