package com.funkit.dao;

import com.funkit.model.Member;

import java.util.Optional;

public interface LoginDao {
    void register(Member member);

    boolean checkId(String id);

    Optional<Member> checkEmail(String email);
}
