package com.funkit.model;

import com.fasterxml.jackson.annotation.JsonInclude;


//response type을 json로 주기 위한 dto
@JsonInclude(JsonInclude.Include.NON_NULL)
public class DefaultResponse<T> {
    private int status;
    private String msg;
    private T data;

    public DefaultResponse(int status, String msg) {
        this.status = status;
        this.msg = msg;
    }
    public DefaultResponse(int status, String msg, T data){
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
