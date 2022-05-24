package com.funkit.service.manager;

import com.funkit.dao.manager.ManagerDao;
import com.funkit.model.Funding;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService{

    final ManagerDao managerDao;

    public ManagerServiceImpl(ManagerDao managerDao) {
        this.managerDao = managerDao;
    }

    @Override
    public List<Funding> getApprovalReqFundingList() {
        return managerDao.getApprovalReqFundingList();
    }
}
