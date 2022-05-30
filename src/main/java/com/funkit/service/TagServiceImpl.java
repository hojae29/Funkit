package com.funkit.service;

import com.funkit.dao.TagDao;
import com.funkit.model.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TagServiceImpl implements TagService{

    @Autowired
    TagDao dao;

    @Override
    public List<Tag> tagList() {
        return dao.tagList();
    }
}
