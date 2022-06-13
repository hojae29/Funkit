package com.funkit.dao.funding;

import com.funkit.model.Order;
import com.funkit.model.PayInfo;

import java.util.List;

public interface OrderDao {
    void addOrder(Order order);

    List<PayInfo> getOrderListById(String id);

    PayInfo getOrderByOrderCode(int orderCode);

    void changeOrderStatus(int orderCode, int statusCode);

    int getOrderCount(String id);

    List<Order> findOrderListByFundingCode(int fundingCode);
}
