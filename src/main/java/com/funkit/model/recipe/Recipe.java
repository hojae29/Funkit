package com.funkit.model.recipe;

import com.funkit.model.Tag;

import java.util.Date;
import java.util.List;

public class Recipe<T> {
    private int recipeCode;
    private String id;
    private String title;
    private String intro;
    private Date regDate;
    private Date updateDate;
    private int view;
    private int favoriteCnt;
    private int takes;
    private int status;

    private T mainImage;

    private List<T> subImage;

    private List<Cooking> cookings;

    private List<Tag> tags;

    public List<Ingredients> ingredients;

    public int getFavoriteCnt() {
        return favoriteCnt;
    }

    public void setFavoriteCnt(int favoriteCnt) {
        this.favoriteCnt = favoriteCnt;
    }

    public List<T> getSubImage() {
        return subImage;
    }

    public void setSubImage(List<T> subImage) {
        this.subImage = subImage;
    }

    public List<Cooking> getCookings() {
        return cookings;
    }

    public void setCookings(List<Cooking> cookings) {
        this.cookings = cookings;
    }

    public List<Ingredients> getIngredients() {
        return ingredients;
    }

    public void setIngredients(List<Ingredients> ingredients) {
        this.ingredients = ingredients;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }
    public T getMainImage() {
        return mainImage;
    }

    public void setMainImage(T mainImage) {
        this.mainImage = mainImage;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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
                ", view=" + view +
                ", favoriteCnt=" + favoriteCnt +
                ", takes=" + takes +
                ", status=" + status +
                ", mainImage=" + mainImage +
                ", subImage=" + subImage +
                ", cookings=" + cookings +
                ", tags=" + tags +
                ", ingredients=" + ingredients +
                '}';
    }
}
