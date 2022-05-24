package com.funkit.dao.funding;

import com.funkit.model.Reward;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class RewardDaoImpl implements RewardDao{

    final SqlSession sql;

    public RewardDaoImpl(SqlSession sql) {
        this.sql = sql;
    }

    @Override
    public Reward addReward(Reward reward) {
        sql.insert("reward.insertReward", reward);
        return sql.selectOne("funding.getReward", reward.getRewardCode());
    }

    @Override
    public void deleteReward(int rewardCode) {
        sql.delete("reward.deleteReward", rewardCode);
    }

    @Override
    public Reward getReward(int rewardCode) {
        return sql.selectOne("reward.getReward", rewardCode);
    }

    @Override
    public Reward updateReward(Reward reward) {
        sql.update("reward.updateReward", reward);
        return sql.selectOne("reward.getReward", reward.getRewardCode());
    }
}
