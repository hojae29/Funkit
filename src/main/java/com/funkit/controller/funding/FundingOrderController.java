package com.funkit.controller.funding;

import com.funkit.model.Order;
import com.funkit.service.funding.OrderService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/funding/order")
public class FundingOrderController {

    final OrderService orderService;

    public FundingOrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PatchMapping("/{orderCode}")
    public ResponseEntity changeOrderStatus(@PathVariable int orderCode,
                                            @RequestParam("statusCode") int statusCode){
        return orderService.changeOrderStatus(orderCode, statusCode);
    }

    @GetMapping("/{orderCode}")
    public Order getOrder(@PathVariable int orderCode){
        return orderService.getOrderByOrderCode(orderCode);
    }

}
