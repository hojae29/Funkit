package com.funkit.dao;

import com.funkit.model.CompanyMember;
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
    public void companyRegister(CompanyMember companyMember) {
        sql.insert("login.companyRegister", companyMember);
    }

    @Override
    public Optional<Member> individualItem(String id) {
        return Optional.ofNullable(sql.selectOne("login.individualItem", id));
    }

    @Override
    public Optional<CompanyMember> companyItem(String id) {
        return Optional.ofNullable(sql.selectOne("login.companyItem", id));
    }
}
