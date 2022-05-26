package com.funkit.model;

public class Reward {
    private int rewardCode;
    private int fundingCode;
    private String title;
    private String info;
    private int quantity;
    private int amount;
    private int delivery;

    public int getRewardCode() {
        return rewardCode;
    }

    public void setRewardCode(int rewardCode) {
        this.rewardCode = rewardCode;
    }

    public int getFundingCode() {
        return fundingCode;
    }

    public void setFundingCode(int fundingCode) {
        this.fundingCode = fundingCode;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getDelivery() {
        return delivery;
    }

    public void setDelivery(int delivery) {
        this.delivery = delivery;
    }

    @Override
    public String toString() {
        return "reward{" +
                "rewardCode=" + rewardCode +
                ", fundingCode=" + fundingCode +
                ", title='" + title + '\'' +
                ", info='" + info + '\'' +
                ", quantity=" + quantity +
                ", amount=" + amount +
                ", delivery=" + delivery +
                '}';
    }
}
