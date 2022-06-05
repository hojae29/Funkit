package com.funkit.controller.mypage.individual;

import com.funkit.model.Member;
import com.funkit.model.Order;
import com.funkit.service.funding.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/myfunkit/individual")
public class IndividualController {

    final OrderService orderService;

    public IndividualController(OrderService orderService) {
        this.orderService = orderService;
    }

    @RequestMapping("/funding")
    public String myPage(@SessionAttribute Member member, Model model){
        List<Order> orderList = orderService.getOrderListById(member.getId());
        model.addAttribute("orderList", orderList);
        return "/mypage/individual";
    }
}
