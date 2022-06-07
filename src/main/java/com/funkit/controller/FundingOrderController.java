package com.funkit.controller;

import com.funkit.model.Order;
import com.funkit.service.funding.OrderService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/funding/order")
public class FundingOrderController {

    final OrderService orderService;

    public FundingOrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @ResponseBody
    @PatchMapping("")
    public ResponseEntity changeOrderStatus(@RequestParam("orderCode") int orderCode,
                                            @RequestParam("statusCode") int statusCode){
        return orderService.changeOrderStatus(orderCode, statusCode);
    }

    @ResponseBody
    @GetMapping("")
    public Order getOrder(@RequestParam("code") int orderCode){
        Order order = orderService.getOrderByOrderCode(orderCode);

        return order;
    }
}
