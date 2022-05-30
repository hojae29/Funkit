package com.funkit.service;

import com.funkit.dao.RecipeDao;
import com.funkit.model.Image;
import com.funkit.model.Recipe;
import com.funkit.model.Tag;
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
    public int add(Recipe recipe) {
        return dao.add(recipe);
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
    public List<Tag> tag() {
        return dao.tag();
    }


}
