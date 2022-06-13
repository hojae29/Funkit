package com.funkit.controller.funding;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import com.funkit.service.TagService;
import com.funkit.service.funding.FundingService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/funding/filter")
public class FundingApiController {

    final FundingService fundingService;

    public FundingApiController(FundingService fundingService, TagService tagService) {
        this.fundingService = fundingService;
    }

    @GetMapping("")
    public List<Funding<Image>> funding(Integer tagCode, String keyword, Integer order){
        List<Funding<Image>> fundingList = fundingService.getFundingList(tagCode, keyword, order);

        return fundingList;
    }
}
