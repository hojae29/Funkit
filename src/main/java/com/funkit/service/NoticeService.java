package com.funkit.service;

import com.funkit.model.Notice;

import java.util.List;

public interface NoticeService {
    void add(Notice notice);

    void update(Notice notice);

    List<Notice> list();

    Notice view(int noticeCode);

    void delete(int noticeCode);

    Notice item(int noticeCode);
}

