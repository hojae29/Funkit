package com.funkit.service.funding;

import com.funkit.model.Reward;
import org.springframework.http.ResponseEntity;

public interface RewardService {
    ResponseEntity addReward(Reward reward);

    ResponseEntity deleteReward(int rewardCode);

    ResponseEntity getReward(int rewardCode);

    ResponseEntity updateReward(Reward reward);
}
