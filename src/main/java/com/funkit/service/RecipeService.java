package com.funkit.service;

import com.funkit.model.Recipe;

import java.util.List;

public interface RecipeService {
    List<Recipe> list();

    int add(Recipe recipe);

    void delete(int recipeCode);

 /*   int addImg(Recipe recipeMain);*/
}
