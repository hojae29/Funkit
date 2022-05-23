package com.funkit.controller.mypage.company;

import com.funkit.model.Reward;
import com.funkit.service.mypage.company.FundingService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/myfunkit/funding/{code}/reward")
public class RewardApiController {

    final FundingService fundingService;

    public RewardApiController(FundingService fundingService) {
        this.fundingService = fundingService;
    }

    @GetMapping
    public ResponseEntity getReward(@RequestParam("code") int rewardCode){
        return fundingService.getReward(rewardCode);
    }

    @PostMapping
    public ResponseEntity addReward(@PathVariable int code, @RequestBody Reward reward){
        reward.setFundingCode(code);
        return fundingService.addReward(reward);
    }

    @DeleteMapping
    public ResponseEntity deleteReward(@RequestParam("code") int rewardCode){
        return fundingService.deleteReward(rewardCode);
    }

    @PatchMapping
    public  ResponseEntity updateReward(@RequestBody Reward reward){
        return fundingService.updateReward(reward);
    }
}
