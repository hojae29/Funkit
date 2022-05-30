package com.funkit.dao;

import com.funkit.model.Tag;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TagDaoImpl implements TagDao{

    @Autowired
    SqlSession sql;

    @Override
    public List<Tag> tagList() {
        return sql.selectList("tag.tag");
    }
}
