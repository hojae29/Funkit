package com.funkit.service.recipe;

import com.funkit.model.Image;
import com.funkit.model.recipe.Recipe;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface RecipeService {
    List<Recipe> list();

    int getCode(Recipe recipe);

    void delete(int recipeCode);

    Recipe<Image> getRecipeCode(int recipeCode);

    void add(Recipe<MultipartFile> recipe);

    Recipe recipeView(int recipeCode);

    void updateView(int recipeCode);
}
