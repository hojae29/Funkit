package com.funkit.service.funding;

import com.funkit.dao.funding.OrderDao;
import com.funkit.model.JsonResponse;
import com.funkit.model.Order;
import com.funkit.model.PayInfo;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{

    final OrderDao orderDao;

    public OrderServiceImpl(OrderDao orderDao) {
        this.orderDao = orderDao;
    }

    @Override
    @Transactional
    public ResponseEntity addOrder(PayInfo payInfo) {
        orderDao.addOrder(payInfo);
        return new JsonResponse<>(HttpStatus.CREATED, "order success").toResponseEntity();
    }

    @Override
    public List<Order> getOrderListById(String id) {
        return orderDao.getOrderListById(id);
    }
}
