package com.funkit.dao.recipe;

import com.funkit.model.Image;

import java.util.List;
import java.util.Map;

public interface RecipeMainImgDao {
    void addMainImgName(Map map);

    void createImg(int recipeCode);

}
