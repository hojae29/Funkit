package com.funkit.service.recipe;

import com.funkit.dao.recipe.RecipeDao;
import com.funkit.model.Image;
import com.funkit.model.recipe.Recipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class RecipeServiceImpl implements RecipeService{

    @Autowired
    RecipeDao dao;

    @Override
    public List<Recipe> list() {
        return dao.list();
    }

    @Override
    public int getCode(Recipe recipe) {
        return dao.getCode(recipe);
    }

    @Override
    public void delete(int recipeCode) {
        dao.delete(recipeCode);
    }

    @Override
    public Recipe<Image> getRecipeCode(int recipeCode) {
        return dao.getRecipeCode(recipeCode);
    }

    @Override
    public void add(Recipe<MultipartFile> recipe) {
        dao.add(recipe);
    }

    @Override
    public Recipe recipeView(int recipeCode) {
        return dao.recipeView(recipeCode);
    }

    @Override
    public void updateView(int recipeCode) {
        dao.updateView(recipeCode);
    }


}
