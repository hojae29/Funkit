package com.funkit.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Funding {
    private int fundingCode;
    private String id;
    private String title;
    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
    private Date regDate;
    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
    private Date expDate;
    private int targetAmount;
    private int cmlAmount;
    private String status;

    private Image mainImage;
    private List<Image> fundingImages;

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public void setExpDate(Date expDate) {
        this.expDate = expDate;
    }

    public Image getMainImage() {
        return mainImage;
    }

    public void setMainImage(Image mainImage) {
        this.mainImage = mainImage;
    }

    public List<Image> getFundingImages() {
        return fundingImages;
    }

    public void setFundingImages(List<Image> fundingImages) {
        this.fundingImages = fundingImages;
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

    public int getTargetAmount() {
        return targetAmount;
    }

    public void setTargetAmount(int targetAmount) {
        this.targetAmount = targetAmount;
    }

    public int getCmlAmount() {
        return cmlAmount;
    }

    public void setCmlAmount(int cmlAmount) {
        this.cmlAmount = cmlAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
