package com.funkit.service.funding;

import com.funkit.model.Order;
import com.funkit.model.PayInfo;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface OrderService {
    ResponseEntity addOrder(Order order);

    List<PayInfo> getOrderListById(String id);

    PayInfo getOrderByOrderCode(int orderCode);

    ResponseEntity changeOrderStatus(int orderCode, int statusCode);

    int getOrderCount(String id);

    List<Order> findOrderListByFundingCode(int fundingCode);
}
