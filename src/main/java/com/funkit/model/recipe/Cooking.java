package com.funkit.model.recipe;

import org.w3c.dom.Text;

public class Cooking {
    private int recipeCode;
    private int cookingSeq;
    private Text cookingProcess;

    public int getRecipeCode() {
        return recipeCode;
    }

    public void setRecipeCode(int recipeCode) {
        this.recipeCode = recipeCode;
    }

    public int getCookingSeq() {
        return cookingSeq;
    }

    public void setCookingSeq(int cookingSeq) {
        this.cookingSeq = cookingSeq;
    }

    public Text getCookingProcess() {
        return cookingProcess;
    }

    public void setCookingProcess(Text cookingProcess) {
        this.cookingProcess = cookingProcess;
    }
}
