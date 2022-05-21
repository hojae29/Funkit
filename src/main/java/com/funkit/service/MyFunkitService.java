package com.funkit.service;

import com.funkit.model.Funding;
import com.funkit.model.Image;

import java.util.List;

public interface MyFunkitService {
    List<Funding<Image>> getFundingList(String id);
}
