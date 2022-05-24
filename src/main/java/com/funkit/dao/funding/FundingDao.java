package com.funkit.dao.funding;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface FundingDao {
    int makeFunding(Funding funding);

    void saveFunding(Funding<MultipartFile> funding);

    Funding<Image> getFundingByFundingCode(int code);

    void setInfoImage(int fundingCode, Image image);

    void deleteInfoImage(List<String> deleteImages);

    Image getMainImage(int fundingCode);

    void insertMainImage(int fundingCode, Image image);

    void updateMainImage(int fundingCode, Image image);

    List<Funding<Image>> getFundingListById(String id);

}
