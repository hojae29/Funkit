package com.funkit.dao;

import com.funkit.model.Notice;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NoticeDaoImpl implements NoticeDao{
    @Autowired
    SqlSession sql;
    @Override
    public void add(Notice notice) {
        sql.insert("notice.add", notice);
    }
    @Override
    public void update(Notice notice) {
        sql.update("notice.update", notice);
    }

    @Override
    public List<Notice> list() {
        return sql.selectList("notice.list");
    }

    @Override
    public Notice view(int noticeCode) {
        return sql.selectOne("notice.view", noticeCode);
    }

    @Override
    public void delete(int noticeCode) {
        sql.delete("notice.delete",noticeCode);
    }
}
