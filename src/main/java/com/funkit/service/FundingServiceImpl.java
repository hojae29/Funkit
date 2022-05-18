package com.funkit.service;

import com.funkit.dao.FundingDao;
import com.funkit.model.Funding;
import com.funkit.model.Image;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class FundingServiceImpl implements FundingService {

    final FundingDao fundingDao;

    public FundingServiceImpl(FundingDao projectDao) {
        this.fundingDao = projectDao;
    }

    @Override
    public int makeFunding(Funding funding) {
        return fundingDao.makeFunding(funding);
    }

    @Override
    public void saveFunding(Funding<MultipartFile> funding) {
        fundingDao.saveFunding(funding);
        if(funding.getMainImage() != null){
            Image image = new Image();
            image.setFileName(funding.getFundingCode() + ".png");
            image.setFileSize(funding.getMainImage().getSize());

            try {
                funding.getMainImage().transferTo(
                        new File("d:/upload/" +
                                funding.getFundingCode() +
                                "/mainImage/" +
                                image.getFileName()));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

            fundingDao.setMainImage(funding.getFundingCode(), image);
        }
    }

    @Override
    public Funding<Image> getFunding(int code) {
        return fundingDao.getFunding(code);
    }
}
