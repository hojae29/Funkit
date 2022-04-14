package com.funkit.service;

import com.funkit.dao.LoginDao;
import com.funkit.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService{

    final LoginDao dao;

    public LoginServiceImpl(LoginDao dao) {
        this.dao = dao;
    }

    @Override
    public void register(Member member) {
        dao.register(member);
    }
}
