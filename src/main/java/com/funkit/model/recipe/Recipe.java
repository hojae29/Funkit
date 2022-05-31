package com.funkit.model.recipe;

import java.util.Date;

public class Recipe<T> {
    private int recipeCode;
    private String id;
    private String title;
    private String intro;
    private Date regDate;
    private Date updateDate;
    private int like;
    private int view;
    private int takes;

    private int status;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    private T mainImage;

    public T getMainImage() {
        return mainImage;
    }

    public void setMainImage(T mainImage) {
        this.mainImage = mainImage;
    }

    public int getTakes() {
        return takes;
    }

    public void setTakes(int takes) {
        this.takes = takes;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public int getRecipeCode() {
        return recipeCode;
    }

    public void setRecipeCode(int recipeCode) {
        this.recipeCode = recipeCode;
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

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    @Override
    public String toString() {
        return "Recipe{" +
                "recipeCode=" + recipeCode +
                ", id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", intro='" + intro + '\'' +
                ", regDate=" + regDate +
                ", updateDate=" + updateDate +
                ", like=" + like +
                ", view=" + view +
                ", takes=" + takes +
                '}';
    }
}
