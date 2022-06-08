package com.funkit.model.recipe;

public class Favorite {

    private int likeInfo;
    private String id;
    private int recipeCode;

    public int getRecipeCode() {
        return recipeCode;
    }

    public void setRecipeCode(int recipeCode) {
        this.recipeCode = recipeCode;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getLikeInfo() {
        return likeInfo;
    }

    public void setLikeInfo(int likeInfo) {
        this.likeInfo = likeInfo;
    }

    @Override
    public String toString() {
        return "Like{" +
                "likeInfo=" + likeInfo +
                ", id='" + id + '\'' +
                ", recipeCode=" + recipeCode +
                '}';
    }
}
