package com.funkit.model.recipe;

public class Cooking {
    private int code;
    private int cookingSeq;
    private String cookingExplain;

    private String fileName;
    private long size;
    private String location;

    public Cooking (int cookingSeq, String cookingExplain, String fileName, long size, String location){
        this.cookingSeq=cookingSeq;
        this.cookingExplain=cookingExplain;
        this.fileName=fileName;
        this.size=size;
        this.location=location;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getCookingSeq() {
        return cookingSeq;
    }

    public void setCookingSeq(int cookingSeq) {
        this.cookingSeq = cookingSeq;
    }

    public String getCookingExplain() {
        return cookingExplain;
    }

    public void setCookingExplain(String cookingExplain) {
        this.cookingExplain = cookingExplain;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public long getSize() {
        return size;
    }

    public void setSize(long size) {
        this.size = size;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Override
    public String toString() {
        return "Cooking{" +
                "code=" + code +
                ", cookingSeq=" + cookingSeq +
                ", cookingExplain='" + cookingExplain + '\'' +
                ", fileName='" + fileName + '\'' +
                ", size=" + size +
                ", location='" + location + '\'' +
                '}';
    }
}
