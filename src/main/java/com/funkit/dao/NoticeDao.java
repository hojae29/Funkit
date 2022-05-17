package com.funkit.dao;

import com.funkit.model.Notice;

import java.util.List;

public interface NoticeDao {
    void add(Notice notice);

    void update(Notice notice);

    List<Notice> list();

    Notice view(int noticeCode);

    void delete(int noticeCode);
}
