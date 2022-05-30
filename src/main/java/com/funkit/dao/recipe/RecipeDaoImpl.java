package com.funkit.dao.recipe;

import com.funkit.model.Image;
import com.funkit.model.recipe.Recipe;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

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
    public int getCode(Recipe recipe) {

        sql.insert("recipe.add",recipe);

        return recipe.getRecipeCode();
    }

    @Override
    public void delete(int recipeCode) {
        sql.delete("recipe.delete",recipeCode);
    }

    @Override
    public Recipe<Image> getRecipeCode(int recipeCode) {
        Recipe<Image> recipe = sql.selectOne("recipe.getRecipeCode",recipeCode);

        return recipe;
    }

    @Override
    public void add(Recipe<MultipartFile> recipe) {
        sql.update("recipe.addUpdate",recipe);
    }

}
