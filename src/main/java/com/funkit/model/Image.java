package com.funkit.model;

public class Image {
    private int code;
    private String name;
    private long size;
    private String location;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
        return "Image{" +
                "code=" + code +
                ", name='" + name + '\'' +
                ", size=" + size +
                ", location='" + location + '\'' +
                '}';
    }
}
