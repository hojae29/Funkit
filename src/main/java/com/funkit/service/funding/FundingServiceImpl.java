package com.funkit.service.funding;

import com.funkit.dao.funding.FundingDao;
import com.funkit.model.Funding;
import com.funkit.model.Image;
import com.funkit.model.JsonResponse;
import com.funkit.util.Pager;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
    public void saveFunding(Funding<MultipartFile> funding) {
        int fundingCode = funding.getFundingCode();
        var mainImage = funding.getMainImage();
        var infoImage = funding.getInfoImage();
        var deleteImages = funding.getDeleteImages();

        String mainImgPath = "d:/upload/" + fundingCode + "/mainImage/";
        String fundingImgPath = "d:/upload/" + fundingCode + "/infoImage/";

        fundingDao.saveFunding(funding);

        if(mainImage != null && !mainImage.isEmpty()){
            var image = makeImage(funding.getMainImage());

            try {
                funding.getMainImage().transferTo(new File(mainImgPath + image.getFileName()));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

            var item = fundingDao.getMainImage(fundingCode);
            if(item == null) {
                fundingDao.insertMainImage(fundingCode, image);
            } else{
                fundingDao.updateMainImage(fundingCode, image);
                File file = new File(mainImgPath + item.getFileName());
                file.delete();
            }
        }

        if(infoImage != null && !infoImage.isEmpty()){
            for (MultipartFile file : funding.getInfoImage()){
                var image = makeImage(file);

                try {
                    file.transferTo(new File(fundingImgPath + image.getFileName()));
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }

                fundingDao.setInfoImage(funding.getFundingCode(), image);
            }
        }

        if(deleteImages != null && !deleteImages.isEmpty()){
            for(String fileName : funding.getDeleteImages()){
                File file = new File(fundingImgPath + fileName);
                file.delete();
            }
            fundingDao.deleteInfoImage(funding.getDeleteImages());
        }
    }

    @Override
    public Funding<Image> getFundingByFundingCode(int code) {
        return fundingDao.getFundingByFundingCode(code);
    }

    @Override
    public List<Funding<Image>> getFundingListById(String id, Pager pager) {

        pager.setTotal(fundingDao.total(id));

        return fundingDao.getFundingListById(id, pager);
    }

    @Override
    public ResponseEntity deleteFunding(int code) {
        fundingDao.deleteFunding(code);
        return new JsonResponse<>(HttpStatus.OK, "delete ok").toResponseEntity();
    }

    @Override
    public void fundingApprovalReq(int code, int status) {
        fundingDao.fundingApprovalReq(code, status);
    }

    public Image makeImage(MultipartFile file){
        UUID uuid = UUID.randomUUID();

        Image image = new Image();
        image.setFileName(uuid + ".png");
        image.setFileSize(file.getSize());

        return image;
    }
}
