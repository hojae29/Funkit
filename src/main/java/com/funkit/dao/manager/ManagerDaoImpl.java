package com.funkit.dao.manager;

import com.funkit.model.Funding;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ManagerDaoImpl implements ManagerDao{

    final SqlSession sql;

    public ManagerDaoImpl(SqlSession sql) {
        this.sql = sql;
    }

    @Override
    public List<Funding> getApprovalReqFundingList() {
        return sql.selectList("manager.getApprovalReqFundingList");
    }
}
