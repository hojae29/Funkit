package com.funkit.service;

import com.funkit.dao.RecipeMainImgDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
