package com.funkit.model;

import com.funkit.exception.ErrorCode;
import org.springframework.http.ResponseEntity;

public class JsonErrorResponse {
    private final int status;
    private final String message;

    public int getStatus() {
        return status;
    }

    public String getMessage() {
        return message;
    }

    JsonErrorResponse(int status, String message){
        this.status = status;
        this.message = message;
    }

    public static ResponseEntity<JsonErrorResponse> toResponseEntity(ErrorCode errorCode) {
        var errorResponse = new JsonErrorResponse(errorCode.getHttpStatus().value(), errorCode.getDetail());
        return ResponseEntity.status(errorCode.getHttpStatus()).body(errorResponse);
    }
}
