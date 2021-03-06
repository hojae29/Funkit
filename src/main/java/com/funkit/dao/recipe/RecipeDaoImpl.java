package com.funkit.dao.recipe;

import com.funkit.model.Image;
import com.funkit.model.Tag;
import com.funkit.model.recipe.Cooking;
import com.funkit.model.recipe.Ingredients;
import com.funkit.model.recipe.Recipe;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        if(recipe.getTags() != null){
            for(var tag : recipe.getTags()){
                Map map = new HashMap();
                map.put("recipeCode",recipe.getRecipeCode());
                map.put("tag",tag);
                sql.insert("tag.setRecipeTag",map);
            }
        }
        if (recipe.getIngredients() != null){
            for (var ingredients :recipe.getIngredients()){
                Map map = new HashMap();
                map.put("recipeCode",recipe.getRecipeCode());
                map.put("ingredients",ingredients);
                sql.insert("ingredients.setRecipeIngredients",map);
            }
        }
        if(recipe.getCookings() != null){
            for(var cooking : recipe.getCookings()){
                Map map = new HashMap();
                map.put("recipeCode",recipe.getRecipeCode());
                map.put("cooking",cooking);
                sql.insert("cooking.setCooking",map);
            }
        }
    }

    @Override
    public Recipe recipeView(int recipeCode) {
        Recipe<Image> recipe = sql.selectOne("recipe.recipe",recipeCode);
        List<Tag> tagList = sql.selectList("tag.getRecipeTags",recipeCode);
        List<Ingredients> ingredients = sql.selectList("ingredients.getIngredients",recipeCode);
        List<Cooking> cookingList = sql.selectList("cooking.getCookingList",recipeCode);

        recipe.setCookings(cookingList);
        recipe.setTags(tagList);
        recipe.setIngredients(ingredients);

        return recipe;
    }

    @Override
    public void updateView(int recipeCode) {
        sql.update("recipe.updateView",recipeCode);
    }

}
