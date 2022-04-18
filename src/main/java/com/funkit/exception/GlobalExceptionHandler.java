package com.funkit.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {

    //모든 Exception (콘솔에 출력 후 클라이언트에게 SERVER_ERROR 메세지 리턴)
    @ExceptionHandler
    public ResponseEntity handelGlobalException(RuntimeException e){
        e.printStackTrace();
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("SERVER_ERROR");
    }

    //CustomException (ErrorCode.class 로 관리) (ResponseEntity 리턴)
    @ExceptionHandler(CustomException.class)
    public ResponseEntity handleAlreadyExistId(CustomException ex) {
        return JsonErrorResponse.toResponseEntity(ex.getErrorCode());
    }
}
