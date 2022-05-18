package com.funkit.dao;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import org.springframework.web.multipart.MultipartFile;

public interface FundingDao {
    int makeFunding(Funding funding);

    void saveFunding(Funding<MultipartFile> funding);

    Funding<Image> getFunding(int code);

    void setMainImage(int fundingCode, Image image);

    void setFundingImage(int fundingCode, Image image);
}
