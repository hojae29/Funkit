package com.funkit.service;

import com.funkit.dao.MyFunkitDao;
import com.funkit.model.Funding;
import com.funkit.model.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyFunkitServiceImpl implements MyFunkitService{

    final MyFunkitDao myFunkitDao;

    public MyFunkitServiceImpl(MyFunkitDao myFunkitDao) {
        this.myFunkitDao = myFunkitDao;
    }

    @Override
    public List<Funding<Image>> getFundingList(String id) {
        return myFunkitDao.getFundingList(id);
    }
}
