package com.funkit.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Funding<T> {
    private int fundingCode;
    private String id;
    private String title;
    private String introduction;

    private String status;

    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
    private Date startDate;
    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
    private Date expDate;

    private Long targetAmount;
    private Long cmlAmount;

    private T mainImage;
    private List<T> infoImage;
    private List<Reward> reward;

    private List<String> deleteImages;
    private List<Integer> tags;

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

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    public T getMainImage() {
        return mainImage;
    }

    public void setMainImage(T mainImage) {
        this.mainImage = mainImage;
    }

    public List<T> getInfoImage() {
        return infoImage;
    }

    public void setInfoImage(List<T> infoImage) {
        this.infoImage = infoImage;
    }

    public List<Reward> getReward() {
        return reward;
    }

    public void setReward(List<Reward> reward) {
        this.reward = reward;
    }

    public List<String> getDeleteImages() {
        return deleteImages;
    }

    public void setDeleteImages(List<String> deleteImages) {
        this.deleteImages = deleteImages;
    }

    public List<Integer> getTags() {
        return tags;
    }

    public void setTags(List<Integer> tags) {
        this.tags = tags;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) throws ParseException {
        var formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.startDate = formatter.parse(startDate);
    }

    public Date getExpDate() {
        return expDate;
    }

    public void setExpDate(String expDate) throws ParseException {
        var formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.expDate = formatter.parse(expDate);
    }

    public int getDDay() throws ParseException {
        String todayFm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis())); // 오늘날짜
        var dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date today = new Date(dateFormat.parse(todayFm).getTime());

        long calculate = expDate.getTime() - today.getTime();

        int Ddays = (int) (calculate / ( 24*60*60*1000));
        System.out.println("두 날짜 차이일 : " + Ddays);

        return Ddays;
    }

}
