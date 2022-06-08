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
}
