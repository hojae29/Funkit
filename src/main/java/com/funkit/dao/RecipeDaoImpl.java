package com.funkit.dao;

import com.funkit.model.Recipe;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RecipeDaoImpl implements RecipeDao{
    @Autowired
    SqlSession sql;

    @Override
    public List<Recipe> list() {

        return sql.selectList("recipe.list");
    }

    @Override
    public int add(Recipe recipe) {

        sql.insert("recipe.add",recipe);

        return recipe.getRecipeCode();
    }

    @Override
    public void delete(int recipeCode) {
        sql.delete("recipe.delete",recipeCode);
    }

/*    @Override
    public int addImg(Recipe recipeMain) {
        sql.insert("recipe.mainImg",recipeMain.getRecipeCode());
        return recipeMain.getRecipeCode();
    }*/
}
