package com.funkit.service.manager;

import com.funkit.model.Funding;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface ManagerService {
    List<Funding> getApprovalReqFundingList();

    ResponseEntity fundingApproval(int code);
}
