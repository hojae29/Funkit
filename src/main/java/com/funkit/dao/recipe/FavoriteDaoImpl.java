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

    @Override
    public void updateCnt(Favorite favorite) {
        sql.update("favorite.updateCnt",favorite);
    }

    @Override
    public int likeCheck(Favorite favorite) {
        return sql.selectOne("favorite.likeCheck",favorite);
    }

    @Override
    public void deleteLike(Favorite favorite) {
        sql.delete("favorite.likeCancel",favorite);
    }
}
