package com.funkit.service.funding;

import com.funkit.model.Order;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface OrderService {
    ResponseEntity addOrder(Order order);

    List<Order> getOrderListById(String id);

    Order getOrderByOrderCode(int orderCode);

    ResponseEntity changeOrderStatus(int orderCode, int statusCode);

    int getOrderCount(String id);

    List<Order> findOrderListByFundingCode(int fundingCode);

    Order getPayInfoByOrderCode(int orderCode);
}
