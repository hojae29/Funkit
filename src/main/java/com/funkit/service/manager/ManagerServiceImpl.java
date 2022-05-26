package com.funkit.service.manager;

import com.funkit.dao.manager.ManagerDao;
import com.funkit.model.Funding;
import com.funkit.model.JsonResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

    @Override
    public ResponseEntity fundingApproval(int code) {
        managerDao.fundingApproval(code);
        return new JsonResponse<>(HttpStatus.OK, "approval success").toResponseEntity();
    }
}
