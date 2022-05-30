package com.funkit.service;

import com.funkit.model.Image;
import com.funkit.model.Recipe;
import com.funkit.model.Tag;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface RecipeService {
    List<Recipe> list();

    int add(Recipe recipe);

    void delete(int recipeCode);

    Recipe<Image> getRecipeCode(int recipeCode);

    List<Tag> tag();
}
