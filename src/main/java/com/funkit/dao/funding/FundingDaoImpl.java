package com.funkit.dao.funding;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import com.funkit.model.Reward;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class FundingDaoImpl implements FundingDao {

    final SqlSession sql;

    public FundingDaoImpl(SqlSession sql) {
        this.sql = sql;
    }

    @Override
    public int makeFunding(Funding funding) {
        sql.insert("funding.makeFunding", funding);
        return funding.getFundingCode();
    }

    @Override
    public void saveFunding(Funding<MultipartFile> funding) {
        sql.update("funding.saveFunding", funding);
    }

    @Override
    public Funding<Image> getFundingByFundingCode(int code) {

        Funding<Image> funding = sql.selectOne("funding.getFundingByFundingCode", code);
        Image mainImage = sql.selectOne("funding.getMainImage", code);
        List<Image> fundingImages = sql.selectList("funding.getFundingImageList", code);
        List<Reward> rewards = sql.selectList("reward.getRewardList", code);


        funding.setMainImage(mainImage);
        funding.setFundingImage(fundingImages);
        funding.setReward(rewards);

        return funding;
    }

    @Override
    public void setFundingImage(int fundingCode, Image image) {
        Map map = new HashMap();
        map.put("fundingCode", fundingCode);
        map.put("image", image);
        sql.insert("funding.insertFundingImage", map);
    }

    @Override
    public void deleteFundingImage(List<String> deleteImages) {
        for(String fileName : deleteImages){
            sql.delete("funding.deleteFundingImage", fileName);
        }
    }

    @Override
    public Image getMainImage(int fundingCode) {
        return sql.selectOne("funding.getMainImage", fundingCode);
    }

    @Override
    public void insertMainImage(int fundingCode, Image image) {
        Map map = new HashMap();
        map.put("fundingCode", fundingCode);
        map.put("image", image);

        sql.insert("funding.insertMainImage", map);
    }

    @Override
    public void updateMainImage(int fundingCode, Image image) {
        Map map = new HashMap();
        map.put("fundingCode", fundingCode);
        map.put("image", image);

        sql.update("funding.updateMainImage", map);
    }

    @Override
    public List<Funding<Image>> getFundingListById(String id) {
        return sql.selectList("funding.getFundingListById", id);
    }
}
