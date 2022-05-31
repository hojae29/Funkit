package com.funkit.dao.recipe;

import com.funkit.model.Image;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class RecipeMainImgDaoImpl implements RecipeMainImgDao{

    @Autowired
    SqlSession sql;

    @Override
    public void createImg(int recipeCode) {
        sql.insert("recipe_main.recipeMainImg",recipeCode);
    }


    @Override
    public void addMainImgName(Map map) {
        sql.update("recipe_main.updateMain",map);
    }

}
