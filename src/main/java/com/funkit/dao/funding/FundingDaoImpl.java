package com.funkit.dao.funding;

import com.funkit.model.*;
import com.funkit.util.Pager;
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
        sql.delete("tag.deleteFundingTag", funding);
        if(funding.getTags() != null){
            for(var tag : funding.getTags()){
                Map map = new HashMap();
                map.put("fundingCode", funding.getFundingCode());
                map.put("tag", tag);
                sql.insert("tag.setFundingTag", map);
            }
        }
    }

    @Override
    public Funding<Image> getFundingByFundingCode(int fundingCode) {

        Funding<Image> funding = sql.selectOne("funding.getFundingByFundingCode", fundingCode);
        Image mainImage = sql.selectOne("funding.getMainImage", fundingCode);
        List<Image> infoImages = sql.selectList("funding.getInfoImageList", fundingCode);
        List<Reward> rewards = sql.selectList("reward.getRewardList", fundingCode);
        List<Tag> tagList = sql.selectList("tag.getTagListByFundingCode", fundingCode);
        long cmlAmount = sql.selectOne("funding.getFundingCmlAmount", fundingCode);
        int percentage = sql.selectOne("funding.getFundingPercentage", fundingCode);

        funding.setMainImage(mainImage);
        funding.setInfoImage(infoImages);
        funding.setReward(rewards);
        funding.setTags(tagList);
        funding.setCmlAmount(cmlAmount);
        funding.setPercentage(percentage);

        return funding;
    }

    @Override
    public void setInfoImage(int fundingCode, Image image) {
        Map map = new HashMap();
        map.put("fundingCode", fundingCode);
        map.put("image", image);
        sql.insert("funding.insertInfoImage", map);
    }

    @Override
    public void deleteInfoImage(List<String> deleteImages) {
        for(String fileName : deleteImages){
            sql.delete("funding.deleteInfoImage", fileName);
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
    public List<Funding<Image>> getFundingList(Integer tagCode, String keyword, Integer order) {
        Map map = new HashMap();
        map.put("tagCode", tagCode);
        map.put("keyword", keyword);
        map.put("order", order);

        return sql.selectList("funding.getFundingList", map);
    }

    @Override
    public List<Funding<Image>> getFundingListById(String id, Pager pager) {
        Map map = new HashMap();
        map.put("id", id);
        map.put("pager", pager);

        return sql.selectList("funding.getFundingListById", map);
    }

    @Override
    public int total(String id) {
        return sql.selectOne("funding.total", id);
    }

    @Override
    public void deleteFunding(int fundingCode) {
        sql.delete("funding.deleteFunding", fundingCode);
    }

    @Override
    public int getFundingUserCount(int fundingCode) {
        return sql.selectOne("funding.getFundingUserCount", fundingCode);
    }

    @Override
    public Member getMaker(int fundingCode) {
        return sql.selectOne("funding.getMaker", fundingCode);
    }

    @Override
    public List<Funding> findFundingByStatusCode(int statusCode) {
        return sql.selectList("funding.findFundingByStatusCode", statusCode);
    }

    @Override
    public void updateFundingStatusCode(int fundingCode, int statusCode) {
        Map map = new HashMap();
        map.put("fundingCode", fundingCode);
        map.put("statusCode", statusCode);
        sql.update("funding.updateFundingStatusCode", map);
    }

}
