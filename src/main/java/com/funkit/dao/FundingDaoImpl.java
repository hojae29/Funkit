package com.funkit.dao;

import com.funkit.model.Funding;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FundingDaoImpl implements FundingDao {

    final SqlSession sql;

    public FundingDaoImpl(SqlSession sql) {
        this.sql = sql;
    }

    @Override
    public int makeFunding(Funding funding) {
        sql.insert("funding.makeFunding", funding);
        return funding.getFundingCode();
    }
}
