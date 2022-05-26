package com.funkit.model;

public class FundingStatus {

    private int statusCode;
    private String status;

    public int getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "FundingStatus{" +
                "statusCode=" + statusCode +
                ", status='" + status + '\'' +
                '}';
    }
}
