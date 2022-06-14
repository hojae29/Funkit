package com.funkit.service.funding;

import com.funkit.dao.funding.OrderDao;
import com.funkit.model.JsonResponse;
import com.funkit.model.Order;
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
    public ResponseEntity addOrder(Order order) {
        orderDao.addOrder(order);
        return new JsonResponse<>(HttpStatus.CREATED, "order success").toResponseEntity();
    }

    @Override
    public List<Order> getOrderListById(String id) {
        return orderDao.getOrderListById(id);
    }

    @Override
    public Order getOrderByOrderCode(int orderCode) {

        return orderDao.getOrderByOrderCode(orderCode);
    }

    @Override
    public ResponseEntity changeOrderStatus(int orderCode, int statusCode) {
        orderDao.changeOrderStatus(orderCode, statusCode);
        return new JsonResponse<>(HttpStatus.OK, "success").toResponseEntity();
    }

    @Override
    public int getOrderCount(String id) {
        return orderDao.getOrderCount(id);
    }

    @Override
    public List<Order> findOrderListByFundingCode(int fundingCode) {
        return orderDao.findOrderListByFundingCode(fundingCode);
    }

    @Override
    public Order getPayInfoByOrderCode(int orderCode) {
        return orderDao.getPayInfoByOrderCode(orderCode);
    }
}
