package com.funkit.dao.recipe;

import com.funkit.model.recipe.Favorite;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FavoriteDaoImpl implements FavoriteDao {

    @Autowired
    SqlSession sql;

    @Override
    public void updateLike(Favorite favorite) {
        System.out.println(favorite);
        sql.insert("favorite.updateLike", favorite);
    }
}
