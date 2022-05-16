package com.funkit.service;

import com.funkit.dao.FundingDao;
import com.funkit.model.Funding;
import com.funkit.model.Image;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
        Funding<Image> item = new Funding<>();

    }
}
