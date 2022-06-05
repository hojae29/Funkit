package com.funkit.model.recipe;

import org.w3c.dom.Text;

public class Cooking {
    private int code;
    private int cookingSeq;
    private String cookingProcess;

    private String fileName;
    private long size;
    private String location;

    public Cooking(int cookingSeq, String cookingProcess, String fileName, long size, String location) {
        this.cookingSeq = cookingSeq;
        this.cookingProcess = cookingProcess;
        this.fileName = fileName;
        this.size = size;
        this.location = location;
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

    public String getCookingProcess() {
        return cookingProcess;
    }

    public void setCookingProcess(String cookingProcess) {
        this.cookingProcess = cookingProcess;
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
                ", cookingProcess='" + cookingProcess + '\'' +
                ", fileName='" + fileName + '\'' +
                ", size=" + size +
                ", location='" + location + '\'' +
                '}';
    }
}
