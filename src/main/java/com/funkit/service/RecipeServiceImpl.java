package com.funkit.service;

import com.funkit.dao.RecipeDao;
import com.funkit.model.Recipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    @Transactional
    public void add(Recipe recipe) {
        dao.add(recipe);

    }

    @Override
    public void delete(int recipeCode) {
        dao.delete(recipeCode);
    }
}
