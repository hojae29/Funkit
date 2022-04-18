package com.funkit.service;

import com.funkit.model.Member;
import org.springframework.http.ResponseEntity;

public interface LoginService {
    ResponseEntity register(Member member);

    ResponseEntity checkId(String id);
}
