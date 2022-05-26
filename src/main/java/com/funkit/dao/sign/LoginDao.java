package com.funkit.dao.sign;

import com.funkit.model.Member;

import java.util.Optional;

public interface LoginDao {
    void individualRegister(Member member);
    Optional<Member> item(String id);
}
