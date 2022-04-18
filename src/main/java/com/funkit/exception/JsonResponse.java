package com.funkit.exception;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class JsonResponse<T> {
    private final int status;
    @JsonIgnore
    private final HttpStatus httpStatus;
    private final String message;
    private T data;

    public int getStatus() {
        return status;
    }

    public HttpStatus getHttpStatus() {
        return httpStatus;
    }

    public String getMessage() {
        return message;
    }

    public T getData() {
        return data;
    }

    public JsonResponse(HttpStatus httpStatus, String message){
        this.httpStatus = httpStatus;
        this.message = message;
        this.status = httpStatus.value();
    }

    public JsonResponse(HttpStatus httpStatus, String message, T data){
        this.httpStatus = httpStatus;
        this.message = message;
        this.data = data;
        this.status = httpStatus.value();
    }

    public ResponseEntity<JsonResponse> toResponseEntity() {
        return ResponseEntity.status(status).body(this);
    }
}
