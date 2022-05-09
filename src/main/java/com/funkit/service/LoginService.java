package com.funkit.service;

import com.funkit.model.CompanyMember;
import com.funkit.model.Member;
import org.springframework.http.ResponseEntity;

public interface LoginService {
    ResponseEntity individualRegister(Member member);

    ResponseEntity companyRegister(CompanyMember companyMember);
    ResponseEntity checkId(String id);
    boolean login(Member member);
}
