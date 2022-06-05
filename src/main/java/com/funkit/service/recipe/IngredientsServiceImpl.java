package com.funkit.service.recipe;

import com.funkit.dao.recipe.IngredientsDao;
import com.funkit.model.recipe.Ingredients;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IngredientsServiceImpl implements IngredientsService{

    @Autowired
    IngredientsDao dao;

}
