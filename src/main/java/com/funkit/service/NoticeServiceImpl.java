package com.funkit.service;

import com.funkit.dao.NoticeDao;
import com.funkit.model.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService{
    @Autowired
    NoticeDao dao;
    @Override
    public void add(Notice notice) {
        dao.add(notice);
    }

    @Override
    public  void update(Notice notice) {
        dao.update(notice);
    }

    @Override
    public List<Notice> list() {
        return dao.list();
    }

    @Override
    public Notice view(int noticeCode) {
        return dao.view(noticeCode);
    }

    @Override
    public void delete(int noticeCode) {
        dao.delete(noticeCode);
    }
}
