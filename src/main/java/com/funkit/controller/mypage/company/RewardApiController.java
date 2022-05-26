package com.funkit.controller.mypage.company;

import com.funkit.model.Reward;
import com.funkit.service.funding.RewardService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/myfunkit/company/funding/{code}/reward")
public class RewardApiController {

    final RewardService rewardService;

    public RewardApiController(RewardService rewardService) {
        this.rewardService = rewardService;
    }

    @GetMapping
    public ResponseEntity getReward(@RequestParam("code") int rewardCode){
        return rewardService.getReward(rewardCode);
    }

    @PostMapping
    public ResponseEntity addReward(@PathVariable int code, @RequestBody Reward reward){
        reward.setFundingCode(code);
        return rewardService.addReward(reward);
    }

    @DeleteMapping
    public ResponseEntity deleteReward(@RequestParam("code") int rewardCode){
        return rewardService.deleteReward(rewardCode);
    }

    @PatchMapping
    public  ResponseEntity updateReward(@RequestBody Reward reward){
        return rewardService.updateReward(reward);
    }
}
