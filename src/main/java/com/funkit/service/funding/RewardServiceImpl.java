package com.funkit.service.funding;

import com.funkit.dao.funding.RewardDao;
import com.funkit.model.JsonResponse;
import com.funkit.model.Reward;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class RewardServiceImpl implements RewardService{

    final RewardDao rewardDao;

    public RewardServiceImpl(RewardDao rewardDao) {
        this.rewardDao = rewardDao;
    }

    @Override
    public ResponseEntity addReward(Reward reward) {
        Reward item = rewardDao.addReward(reward);

        return new JsonResponse<>(HttpStatus.CREATED, "reward created", item).toResponseEntity();
    }

    @Override
    public ResponseEntity deleteReward(int rewardCode) {
        rewardDao.deleteReward(rewardCode);
        return new JsonResponse<>(HttpStatus.OK, "delete success").toResponseEntity();
    }

    @Override
    public ResponseEntity getReward(int rewardCode) {
        Reward reward = rewardDao.getReward(rewardCode);
        return new JsonResponse<>(HttpStatus.OK, "ok", reward).toResponseEntity();
    }

    @Override
    public ResponseEntity updateReward(Reward reward) {
        Reward item = rewardDao.updateReward(reward);
        return new JsonResponse<>(HttpStatus.OK, "ok", item).toResponseEntity();
    }
}
