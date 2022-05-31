package com.funkit.service.recipe;

import com.funkit.model.Image;

import java.util.List;
import java.util.Map;

public interface RecipeMainImgService {

    void createImg(int recipeCode);

    void addMainImgName(Map map);

}
