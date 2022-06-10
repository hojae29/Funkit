package com.funkit.dao.recipe;

import com.funkit.model.recipe.Favorite;

public interface FavoriteDao {
    void updateLike(Favorite favorite);

    void updateCnt(Favorite favorite);

    int likeCheck(Favorite favorite);

    void deleteLike(Favorite favorite);
}
