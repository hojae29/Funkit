package com.funkit.dao.funding;

import com.funkit.model.Order;
import com.funkit.model.PayInfo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class OrderDaoImpl implements OrderDao {

    final SqlSession sql;

    public OrderDaoImpl(SqlSession sql) {
        this.sql = sql;
    }

    @Override
    public void addOrder(PayInfo payInfo) {
        sql.insert("fundingOrder.addOrder", payInfo);
        if(payInfo.getType().equals("리워드")){ //리워드
            for(var reward : payInfo.getRewardList()){
                Map map = new HashMap();
                map.put("orderCode", payInfo.getOrderCode());
                map.put("reward", reward);
                sql.insert("fundingOrder.addRewardOrder", map);
            }
        }else if(payInfo.getType().equals("지분")){ //지분
            sql.insert("fundingOrder.addInvestOrder", payInfo);
        }
    }

    @Override
    public List<Order> getOrderListById(String id) {
        return sql.selectList("fundingOrder.getOrderListById", id);
    }

    @Override
    public Order getOrderByOrderCode(int orderCode) {
        return sql.selectOne("fundingOrder.getOrderByOrderCode", orderCode);
    }

    @Override
    public void changeOrderStatus(int orderCode, int statusCode) {
        Order order = sql.selectOne("fundingOrder.getOrderByOrderCode", orderCode);
        Map map = new HashMap();
        map.put("orderCode", orderCode);
        map.put("statusCode", statusCode);
        System.out.println(order.getType());
        if(order.getType().equals("리워드")){
            sql.update("fundingOrder.changeRewardOrderStatus", map);
        }else if(order.getType().equals("지분")){
            sql.update("fundingOrder.changeInvestOrderStatus", map);
        }
    }

    @Override
    public int getOrderCount(String id) {
        return sql.selectOne("fundingOrder.getOrderCount", id);
    }
}
