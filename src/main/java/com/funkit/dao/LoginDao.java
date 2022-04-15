package com.funkit.dao;

import com.funkit.model.Member;

public interface LoginDao {
    void register(Member member);

    boolean idCheck(String id);
}
