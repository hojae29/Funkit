package com.funkit.dao.funding;

import com.funkit.model.Reward;

public interface RewardDao {

    Reward addReward(Reward reward);

    void deleteReward(int rewardCode);

    Reward getReward(int rewardCode);

    Reward updateReward(Reward reward);
}
