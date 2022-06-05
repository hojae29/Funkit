package com.funkit.model;

public class Order {
    private long orderCode;
    private String id;
    private String type;
    private String title;
    private String corporateName;
    private String fundingStatus;
    private String orderStatus;

    public long getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(long orderCode) {
        this.orderCode = orderCode;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCorporateName() {
        return corporateName;
    }

    public void setCorporateName(String corporateName) {
        this.corporateName = corporateName;
    }

    public String getFundingStatus() {
        return fundingStatus;
    }

    public void setFundingStatus(String fundingStatus) {
        this.fundingStatus = fundingStatus;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderCode=" + orderCode +
                ", id='" + id + '\'' +
                ", type='" + type + '\'' +
                ", title='" + title + '\'' +
                ", corporateName='" + corporateName + '\'' +
                ", fundingStatus='" + fundingStatus + '\'' +
                ", orderStatus='" + orderStatus + '\'' +
                '}';
    }
}
