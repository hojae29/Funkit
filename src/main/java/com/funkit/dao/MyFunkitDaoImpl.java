package com.funkit.dao;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MyFunkitDaoImpl implements MyFunkitDao{

    final SqlSession sql;

    public MyFunkitDaoImpl(SqlSession sql) {
        this.sql = sql;
    }

    @Override
    public List<Funding<Image>> getFundingList(String id) {
        return sql.selectList("myPageCompany.getFundingList", id);
    }
}
