package com.funkit.dao.funding;

import com.funkit.model.PayInfo;
import com.funkit.model.Order;
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
    public void addOrder(Order order) {
        sql.insert("fundingOrder.addOrder", order);
        if(order.getType().equals("리워드")){ //리워드
            for(var reward : order.getRewardList()){
                Map map = new HashMap();
                map.put("orderCode", order.getOrderCode());
                map.put("reward", reward);
                sql.insert("fundingOrder.addRewardOrder", map);
            }
        }else if(order.getType().equals("지분")){ //지분
            sql.insert("fundingOrder.addInvestOrder", order);
        }
    }

    @Override
    public List<PayInfo> getOrderListById(String id) {
        return sql.selectList("fundingOrder.getOrderListById", id);
    }

    @Override
    public PayInfo getOrderByOrderCode(int orderCode) {
        return sql.selectOne("fundingOrder.getOrderByOrderCode", orderCode);
    }

    @Override
    public void changeOrderStatus(int orderCode, int statusCode) {
        PayInfo payInfo = sql.selectOne("fundingOrder.getOrderByOrderCode", orderCode);
        Map map = new HashMap();
        map.put("orderCode", orderCode);
        map.put("statusCode", statusCode);
        System.out.println(payInfo.getType());
        if(payInfo.getType().equals("리워드")){
            sql.update("fundingOrder.changeRewardOrderStatus", map);
        }else if(payInfo.getType().equals("지분")){
            sql.update("fundingOrder.changeInvestOrderStatus", map);
        }
    }

    @Override
    public int getOrderCount(String id) {
        return sql.selectOne("fundingOrder.getOrderCount", id);
    }

    @Override
    public List<Order> findOrderListByFundingCode(int fundingCode) {
        return sql.selectList("fundingOrder.findOrderListByFundingCode", fundingCode);
    }
}
