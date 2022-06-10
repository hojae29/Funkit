package com.funkit.service.recipe;

import com.funkit.dao.recipe.FavoriteDao;
import com.funkit.model.recipe.Favorite;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FavoriteServiceImpl implements FavoriteService {

    @Autowired
    FavoriteDao dao;

    @Override
    public void updateLike(Favorite favorite) {
        dao.updateLike(favorite);
    }

    @Override
    public void updateCnt(Favorite favorite) {
        dao.updateCnt(favorite);
    }

    @Override
    public int likeCheck(Favorite favorite) {
        return dao.likeCheck(favorite);
    }

    @Override
    public void deleteLike(Favorite favorite) {
        dao.deleteLike(favorite);
    }

}
