package com.funkit.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Funding<T> {
    private int fundingCode;
    private String id;
    private String title;
    private Date regDate;
    private Date expDate;
    private Long targetAmount;
    private Long cmlAmount;
    private String status;
    private String introduction;

    private T mainImage;
    private List<T> fundingImage;

    public T getMainImage() {
        return mainImage;
    }

    public void setMainImage(T mainImage) {
        this.mainImage = mainImage;
    }

    public List<T> getFundingImage() {
        return fundingImage;
    }

    public void setFundingImage(List<T> fundingImage) {
        this.fundingImage = fundingImage;
    }

    public int getFundingCode() {
        return fundingCode;
    }

    public void setFundingCode(int fundingCode) {
        this.fundingCode = fundingCode;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) throws ParseException {
        var formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.regDate = formatter.parse(regDate);
    }

    public Date getExpDate() {
        return expDate;
    }

    public void setExpDate(String expDate) throws ParseException {
        var formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.expDate = formatter.parse(expDate);
    }

    public Long getTargetAmount() {
        return targetAmount;
    }

    public void setTargetAmount(Long targetAmount) {
        this.targetAmount = targetAmount;
    }

    public Long getCmlAmount() {
        return cmlAmount;
    }

    public void setCmlAmount(Long cmlAmount) {
        this.cmlAmount = cmlAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    @Override
    public String toString() {
        return "Funding{" +
                "fundingCode=" + fundingCode +
                ", id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", regDate=" + regDate +
                ", expDate=" + expDate +
                ", targetAmount=" + targetAmount +
                ", cmlAmount=" + cmlAmount +
                ", status='" + status + '\'' +
                ", introduction='" + introduction + '\'' +
                ", mainImage=" + mainImage +
                ", fundingImage=" + fundingImage +
                '}';
    }
}
