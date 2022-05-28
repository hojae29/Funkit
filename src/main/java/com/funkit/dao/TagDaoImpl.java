package com.funkit.dao;

import com.funkit.model.Tag;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TagDaoImpl implements TagDao{

    final SqlSession sql;

    public TagDaoImpl(SqlSession sql) {
        this.sql = sql;
    }

    @Override
    public List<Tag> getTagList() {
        return sql.selectList("tag.getTagList");
    }
}
