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
    public void register(Member member) {
        sql.insert("login.register", member);
    }

    @Override
    public boolean checkId(String id) {
        String item = sql.selectOne("login.checkId", id);
        return item == null;
    }

    @Override
    public Optional<Member> checkEmail(String email) {
        return Optional.ofNullable(sql.selectOne("login.checkEmail", email));
    }
}
