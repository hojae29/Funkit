package com.funkit.service.funding;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import com.funkit.model.JsonResponse;
import com.funkit.util.Pager;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface FundingService {
    int makeFunding(Funding funding);

    ResponseEntity saveFunding(Funding<MultipartFile> funding);

    Funding<Image> getFundingByFundingCode(int code);

    List<Funding<Image>> getFundingList();

    List<Funding<Image>> getFundingListById(String id, Pager pager);

    ResponseEntity deleteFunding(int code);

    void fundingApprovalReq(int code, int status);

    Funding getFunding(int fundingCode);
}
