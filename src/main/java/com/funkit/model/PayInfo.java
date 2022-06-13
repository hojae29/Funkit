package com.funkit.model;

public class PayInfo {
    private String merchantUid;
    private double amount;
    private String cardNumber;
    private String expiry;
    private String birth;
    private String pwd2digit;

    public String getMerchantUid() {
        return merchantUid;
    }

    public void setMerchantUid(String merchantUid) {
        this.merchantUid = merchantUid;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
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

    public String getPwd2digit() {
        return pwd2digit;
    }

    public void setPwd2digit(String pwd2digit) {
        this.pwd2digit = pwd2digit;
    }
}
