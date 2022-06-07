package com.funkit.service.funding;

import com.funkit.model.Order;
import com.funkit.model.PayInfo;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface OrderService {
    ResponseEntity addOrder(PayInfo payInfo);

    List<Order> getOrderListById(String id);

    Order getOrderByOrderCode(int orderCode);

    ResponseEntity changeOrderStatus(int orderCode, int statusCode);

    int getOrderCount(String id);
}
