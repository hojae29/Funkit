package com.funkit.dao;

import com.funkit.model.Funding;
import com.funkit.model.Image;

import java.util.List;

public interface MyFunkitDao {
    List<Funding<Image>> getFundingList(String id);
}
