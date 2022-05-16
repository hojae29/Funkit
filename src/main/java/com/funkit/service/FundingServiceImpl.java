package com.funkit.service;

import com.funkit.dao.FundingDao;
import com.funkit.model.Funding;
import org.springframework.stereotype.Service;

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
}
