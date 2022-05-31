package com.funkit.service;

import com.funkit.dao.TagDao;
import com.funkit.model.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TagServiceImpl  implements TagService{

    final TagDao tagDao;

    public TagServiceImpl(TagDao tagDao) {
        this.tagDao = tagDao;
    }

    @Override
    public List<Tag> getTagList() {
        return tagDao.getTagList();
    }
}
