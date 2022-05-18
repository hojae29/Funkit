package com.funkit.service;

import com.funkit.dao.FundingDao;
import com.funkit.model.Funding;
import com.funkit.model.Image;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

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
    public void saveFunding(Funding<MultipartFile> funding, List<String> deleteImages) {
        fundingDao.saveFunding(funding);

        if(funding.getMainImage() != null){
            UUID uuid = UUID.randomUUID();

            Image image = new Image();
            image.setFileName(uuid + ".png");
            image.setFileSize(funding.getMainImage().getSize());

            try {
                funding.getMainImage().transferTo(new File("d:/upload/" + funding.getFundingCode() + "/mainImage/" + image.getFileName()));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

            fundingDao.setMainImage(funding.getFundingCode(), image);
        }

        if(funding.getFundingImage().size() >= 1){
            for (MultipartFile file : funding.getFundingImage()){
                UUID uuid = UUID.randomUUID();

                Image image = new Image();
                image.setFileName(uuid + ".png");
                image.setFileSize(file.getSize());

                try {
                    file.transferTo(new File("d:/upload/" + funding.getFundingCode() + "/fundingImage/" + image.getFileName()));
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }

                fundingDao.setFundingImage(funding.getFundingCode(), image);
            }
        }
        if(deleteImages.size() >= 1){
            for(String fileName : deleteImages){
                File file = new File("d:/upload/" + funding.getFundingCode() + "/fundingImage/" + fileName);
                file.delete();
            }
            fundingDao.deleteFundingImage(deleteImages);
        }
    }

    @Override
    public Funding<Image> getFunding(int code) {
        return fundingDao.getFunding(code);
    }
}
