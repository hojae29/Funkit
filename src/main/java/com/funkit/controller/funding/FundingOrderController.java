package com.funkit.controller.funding;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.funkit.model.Order;
import com.funkit.model.PayInfo;
import com.funkit.service.funding.OrderService;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
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

    @GetMapping("/{orderCode}/payment")
    public ResponseEntity orderPayment(@PathVariable int orderCode){
        Order order = orderService.getPayInfoByOrderCode(orderCode);
        PayInfo payInfo = new PayInfo();
        payInfo.setMerchantUid("imp48278002");
        payInfo.setCardNumber(order.getCardNumber());
        payInfo.setExpiry(order.getExpiry());
        payInfo.setBirth(order.getBirth());

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "9a0c4724fc5b9273ddd5aee84ee492490606a16e5551aa3ceb4f78a451b7b80ba1a837252daee194");
        headers.setContentType(MediaType.APPLICATION_JSON);


        ObjectMapper objectMapper = new ObjectMapper();
        return null;
    }

}
