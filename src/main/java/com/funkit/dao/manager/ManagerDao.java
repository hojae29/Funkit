package com.funkit.dao.manager;

import com.funkit.model.Funding;

import java.util.List;

public interface ManagerDao {
    List<Funding> getApprovalReqFundingList();

    void fundingApproval(int code);
}
