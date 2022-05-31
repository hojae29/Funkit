package com.funkit.service.recipe;

import com.funkit.dao.recipe.RecipeMainImgDao;
import com.funkit.model.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class RecipeMainImgServiceImpl implements RecipeMainImgService{

    @Autowired
    RecipeMainImgDao dao;

    @Override
    public void addMainImgName(Map map) {
        dao.addMainImgName(map);
    }


    @Override
    public void createImg(int recipeCode) {
        dao.createImg(recipeCode);
    }
}
