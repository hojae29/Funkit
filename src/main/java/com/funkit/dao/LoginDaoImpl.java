package com.funkit.dao;

import com.funkit.model.Member;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public class LoginDaoImpl implements LoginDao{

    final SqlSession sql;

    public LoginDaoImpl(SqlSession sql) {
        this.sql = sql;
    }

    @Override
    public void individualRegister(Member member) {
        sql.insert("login.individualRegister", member);
    }


    @Override
    public Optional<Member> item(String id) {
        return Optional.ofNullable(sql.selectOne("login.item", id));
    }

}
