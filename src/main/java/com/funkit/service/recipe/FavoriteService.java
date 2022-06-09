package com.funkit.service.recipe;

import com.funkit.model.recipe.Favorite;

public interface FavoriteService {
    void updateLike(Favorite favorite);

    void updateCnt(Favorite favorite);

    int likeCheck(Favorite favorite);

    void deleteLike(Favorite favorite);
}
