package com.funkit.model;

public class Tag {
    private int tagCode;
    private String name;

    public Tag(int tagCode) {
        this.tagCode = tagCode;
    }

    public int getTagCode() {
        return tagCode;
    }

    public void setTagCode(int tagCode) {
        this.tagCode = tagCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Tag{" +
                "tagCode=" + tagCode +
                ", name='" + name + '\'' +
                '}';
    }
}
