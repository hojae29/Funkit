package com.funkit.model;

public class PayInfo {
    private String merchant_uid;
    private double amount;
    private String card_number;
    private String expiry;
    private String birth;
    private String pwd_2digit;

    public String getMerchant_uid() {
        return merchant_uid;
    }

    public void setMerchant_uid(String merchant_uid) {
        this.merchant_uid = merchant_uid;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getCard_number() {
        return card_number;
    }

    public void setCard_number(String card_number) {
        this.card_number = card_number;
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

    public String getPwd_2digit() {
        return pwd_2digit;
    }

    public void setPwd_2digit(String pwd_2digit) {
        this.pwd_2digit = pwd_2digit;
    }
}
