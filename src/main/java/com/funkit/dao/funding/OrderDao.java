package com.funkit.dao.funding;

import com.funkit.model.Order;

import java.util.List;

public interface OrderDao {
    void addOrder(Order order);

    List<Order> getOrderListById(String id);

    Order getOrderByOrderCode(int orderCode);

    void changeOrderStatus(int orderCode, int statusCode);

    int getOrderCount(String id);

    List<Order> findOrderListByFundingCode(int fundingCode);

}
