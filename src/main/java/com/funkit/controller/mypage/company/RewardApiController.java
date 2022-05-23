package com.funkit.controller.mypage.company;

import com.funkit.model.JsonResponse;
import com.funkit.model.Reward;
import com.funkit.service.mypage.company.FundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/myfunkit/funding/{code}/reward")
public class RewardApiController {

    final FundingService fundingService;

    public RewardApiController(FundingService fundingService) {
        this.fundingService = fundingService;
    }

    @PostMapping
    public ResponseEntity addReward(@PathVariable int code, @RequestBody Reward reward){
        reward.setFundingCode(code);
        fundingService.addReward(reward);
        return new JsonResponse<>(HttpStatus.CREATED, "created reward").toResponseEntity();
    }

    @DeleteMapping
    public ResponseEntity deleteReward(@RequestParam("code") int rewardCode){
        fundingService.deleteReward(rewardCode);
        return new JsonResponse<>(HttpStatus.OK, "delete success").toResponseEntity();
    }
}
