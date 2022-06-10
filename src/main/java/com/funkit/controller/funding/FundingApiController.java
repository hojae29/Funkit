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
    final TagService tagService;

    public FundingApiController(FundingService fundingService, TagService tagService) {
        this.fundingService = fundingService;
        this.tagService = tagService;
    }

    @GetMapping("")
    public List<Funding<Image>> funding(Integer tagCode, String keyword){
        List<Funding<Image>> fundingList = fundingService.getFundingList(tagCode, keyword);

        return fundingList;
    }
}
