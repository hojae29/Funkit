package com.funkit.dao.funding;

import com.funkit.model.PayInfo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
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
        if(payInfo.getType().equals("reward")){ //리워드
            for(var reward : payInfo.getRewardList()){
                Map map = new HashMap();
                map.put("orderCode", payInfo.getOrderCode());
                map.put("reward", reward);
                sql.insert("fundingOrder.addRewardOrder", map);
            }
        }else if(payInfo.getType().equals("invest")){ //지분
            sql.insert("fundingOrder.addInvestOrder", payInfo);
        }
    }
}
