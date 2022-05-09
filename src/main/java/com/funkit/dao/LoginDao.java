package com.funkit.dao;

import com.funkit.model.CompanyMember;
import com.funkit.model.Member;

import java.util.Optional;

public interface LoginDao {
    void individualRegister(Member member);

    void companyRegister(CompanyMember companyMember);

    Optional<Member> individualItem(String id);

    Optional<CompanyMember> companyItem(String id);
}
