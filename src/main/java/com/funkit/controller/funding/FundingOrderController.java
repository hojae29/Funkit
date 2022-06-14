package com.funkit.controller.funding;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.funkit.exception.CustomException;
import com.funkit.exception.ErrorCode;
import com.funkit.model.JsonResponse;
import com.funkit.model.Order;
import com.funkit.model.PayInfo;
import com.funkit.service.funding.OrderService;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
    public ResponseEntity orderPayment(@PathVariable int orderCode) throws IOException {
        RestTemplate restTemplate = new RestTemplate();
        ObjectMapper objectMapper = new ObjectMapper();

        var reqMap = new HashMap<String, String>();
        reqMap.put("imp_key", "2986387406237350");
        reqMap.put("imp_secret", "Lc5gaD9IvtTKJQoFStyjZ4JEaev5PpQBCWSMz2v4voOffdU7HtrHxalIpRNegDQTzIG9LbegA3vPgqXX");

        var headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        String jsonKey = objectMapper.writeValueAsString(reqMap);
        HttpEntity request = new HttpEntity<>(jsonKey, headers);

        ResponseEntity<String> jsonToken = restTemplate.postForEntity("https://api.iamport.kr/users/getToken", request, String.class);

        var resMap = objectMapper.readValue(jsonToken.getBody(), Map.class);

        String accessToken = (String) ((Map) resMap.get("response")).get("access_token");


        Order order = orderService.getPayInfoByOrderCode(orderCode);

        PayInfo payInfo = new PayInfo();
        payInfo.setMerchant_uid(Long.toString(order.getOrderCode()));
        payInfo.setCard_number(order.getCardNumber());
        payInfo.setExpiry(order.getExpiry());
        payInfo.setBirth(order.getBirth());
        payInfo.setAmount(Double.parseDouble(order.getTotalAmount()));
        payInfo.setPwd_2digit(order.getCardPasswd());

        headers.add("Authorization", accessToken);

        String jsonPayInfo = objectMapper.writeValueAsString(payInfo);

        HttpEntity httpEntity = new HttpEntity<>(jsonPayInfo, headers);

        ResponseEntity<String> response = restTemplate.postForEntity("https://api.iamport.kr/subscribe/payments/onetime", httpEntity, String.class);

        Map resMap2 = objectMapper.readValue(response.getBody(), Map.class);

        System.out.println(resMap2.get("code"));

        //결제오류 or 키인증오류
        if((resMap2.get("code")).equals(-1) || response.getStatusCode() == HttpStatus.UNAUTHORIZED)
            throw new CustomException(ErrorCode.PAYMENT_FAILED);
        else{
            orderService.changeOrderStatus(orderCode, 20);
            return new JsonResponse<>(HttpStatus.OK, "결제완료").toResponseEntity();
        }
    }
}
