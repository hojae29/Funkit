package com.funkit.service.mypage.company;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import com.funkit.model.Reward;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface FundingService {
    int makeFunding(Funding funding);

    void saveFunding(Funding<MultipartFile> funding);

    Funding<Image> getFunding(int code);

    List<Funding<Image>> getFundingList(String id);

    ResponseEntity addReward(Reward reward);

    ResponseEntity deleteReward(int rewardCode);

    ResponseEntity getReward(int rewardCode);

    ResponseEntity updateReward(Reward reward);
}
