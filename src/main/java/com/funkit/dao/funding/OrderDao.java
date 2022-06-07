package com.funkit.dao.funding;

import com.funkit.model.Order;
import com.funkit.model.PayInfo;

import java.util.List;

public interface OrderDao {
    void addOrder(PayInfo payInfo);

    List<Order> getOrderListById(String id);

    Order getOrderByOrderCode(int orderCode);

    void changeOrderStatus(int orderCode, int statusCode);

    int getOrderCount(String id);
}
