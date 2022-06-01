package com.funkit.model;

public class PayInfo {
    private String type;
    private int investAmount;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getInvestAmount() {
        return investAmount;
    }

    public void setInvestAmount(int investAmount) {
        this.investAmount = investAmount;
    }

    @Override
    public String toString() {
        return "PayInfo{" +
                "type='" + type + '\'' +
                ", investAmount=" + investAmount +
                '}';
    }
}
