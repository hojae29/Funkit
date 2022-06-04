package com.funkit.model;

import java.util.List;

public class PayInfo {
    private long orderCode;
    private long fundingCode;
    private String type;
    private List<Reward> rewardList;
    private String totalAmount;
    private String cardNumber;
    private String expiry;
    private String birth;
    private String cardPasswd;

    private String id;

    public long getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(long orderCode) {
        this.orderCode = orderCode;
    }

    public long getFundingCode() {
        return fundingCode;
    }

    public void setFundingCode(long fundingCode) {
        this.fundingCode = fundingCode;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<Reward> getRewardList() {
        return rewardList;
    }

    public void setRewardList(List<Reward> rewardList) {
        this.rewardList = rewardList;
    }

    public String getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(String totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getExpiry() {
        return expiry;
    }

    public void setExpiry(String expiry) {
        this.expiry = expiry;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getCardPasswd() {
        return cardPasswd;
    }

    public void setCardPasswd(String cardPasswd) {
        this.cardPasswd = cardPasswd;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "PayInfo{" +
                "orderCode=" + orderCode +
                ", fundingCode=" + fundingCode +
                ", type='" + type + '\'' +
                ", rewardList=" + rewardList +
                ", totalAmount='" + totalAmount + '\'' +
                ", cardNumber='" + cardNumber + '\'' +
                ", expiry='" + expiry + '\'' +
                ", birth='" + birth + '\'' +
                ", cardPasswd='" + cardPasswd + '\'' +
                ", id='" + id + '\'' +
                '}';
    }
}
