package com.funkit.service.sign;

import com.funkit.model.Member;
import org.springframework.http.ResponseEntity;

public interface LoginService {
    ResponseEntity individualRegister(Member member);
    ResponseEntity checkId(String id);
    Member login(Member member);
}
