package com.funkit.service;

import com.funkit.model.DefaultResponse;
import com.funkit.model.Member;
import org.springframework.http.ResponseEntity;

public interface LoginService {
    ResponseEntity<DefaultResponse<?>> register(Member member);

    ResponseEntity checkId(String id);
}
