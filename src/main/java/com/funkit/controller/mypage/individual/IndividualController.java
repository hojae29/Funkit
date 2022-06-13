package com.funkit.controller.mypage.individual;

import com.funkit.model.Member;
import com.funkit.model.Order;
import com.funkit.service.funding.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/myfunkit/individual")
public class IndividualController {

    final OrderService orderService;

    public IndividualController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("")
    public String myPage(@SessionAttribute Member member, Model model){
        int count = orderService.getOrderCount(member.getId());
        model.addAttribute("orderCount", count);
        return "/mypage/individual";
    }

    @GetMapping("/funding")
    public String myFunding(@SessionAttribute Member member, Model model){
        List<Order> orderList = orderService.getOrderListById(member.getId());
        model.addAttribute("orderList", orderList);
        return "/mypage/myFunding";
    }

}
