package com.funkit.dao;

import com.funkit.model.Recipe;

import java.util.List;

public interface RecipeDao {
    List<Recipe> list();

    void add(Recipe recipe);

    void delete(int recipeCode);
}
