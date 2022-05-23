package com.funkit.dao.mypage.company;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import com.funkit.model.Reward;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface FundingDao {
    int makeFunding(Funding funding);

    void saveFunding(Funding<MultipartFile> funding);

    Funding<Image> getFunding(int code);

    void setFundingImage(int fundingCode, Image image);

    void deleteFundingImage(List<String> deleteImages);

    Image getMainImage(int fundingCode);

    void insertMainImage(int fundingCode, Image image);

    void updateMainImage(int fundingCode, Image image);

    List<Funding<Image>> getFundingList(String id);

    Reward addReward(Reward reward);

    void deleteReward(int rewardCode);

    Reward getReward(int rewardCode);

    Reward updateReward(Reward reward);
}
