package com.funkit.dao.funding;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import com.funkit.model.Reward;
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
    }

    @Override
    public Funding<Image> getFundingByFundingCode(int code) {

        Funding<Image> funding = sql.selectOne("funding.getFundingByFundingCode", code);
        Image mainImage = sql.selectOne("funding.getMainImage", code);
        List<Image> infoImages = sql.selectList("funding.getInfoImageList", code);
        List<Reward> rewards = sql.selectList("reward.getRewardList", code);


        funding.setMainImage(mainImage);
        funding.setInfoImage(infoImages);
        funding.setReward(rewards);

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
    public List<Funding<Image>> getFundingList() {
        return sql.selectList("funding.getFundingList");
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
    public void deleteFunding(int code) {
        sql.delete("funding.deleteFunding", code);
    }

    @Override
    public void fundingApprovalReq(int code, int status) {
        Map map = new HashMap();
        map.put("code", code);
        map.put("status", status);

        sql.update("funding.updateFundingStatus", map);
    }
}
