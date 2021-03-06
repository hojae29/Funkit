package com.funkit.exception;

import org.springframework.http.HttpStatus;

import static org.springframework.http.HttpStatus.*;

//Custom Exception ENUM
public enum ErrorCode {
    /* 400 BAD_REQUEST */
    LOGIN_FAIL(BAD_REQUEST, "로그인 실패"),
    WRONG_ACCESS(BAD_REQUEST, "잘못된 접근입니다"),

    /* 401 UNAUTHORIZED */
    PAYMENT_FAILED(UNAUTHORIZED, "결제 실패"),
    /* 404 NOT_FOUND */

    /* 409 CONFLICT */
    ALREADY_EXIST_ID(CONFLICT, "*사용할 수 없는 아이디입니다"),
    DUPLICATE_RESOURCE(CONFLICT, "데이터가 이미 존재합니다")
    ;

    private final HttpStatus httpStatus;
    private final String detail;

    ErrorCode(HttpStatus status, String detail){
        this.httpStatus = status;
        this.detail = detail;
    }

    public HttpStatus getHttpStatus() {
        return httpStatus;
    }

    public String getDetail() {
        return detail;
    }
}
