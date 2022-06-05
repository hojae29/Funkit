package com.funkit.dao.recipe;

import com.funkit.model.recipe.Ingredients;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IngredientsDaoImpl implements IngredientsDao{

    @Autowired
    SqlSession sql;

}
