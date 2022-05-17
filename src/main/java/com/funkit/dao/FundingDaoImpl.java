package com.funkit.dao;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
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
        sql.insert("funding.makeMainImage", funding.getFundingCode());
        return funding.getFundingCode();
    }

    @Override
    public void saveFunding(Funding<MultipartFile> funding) {
        sql.update("funding.saveFunding", funding);
    }

    @Override
    public Funding<Image> getFunding(int code) {
        Funding<Image> funding = new Funding<>();
        Image mainImage = new Image();
        funding = sql.selectOne("funding.getFunding", code);
        mainImage = sql.selectOne("funding.getMainImage", code);
        funding.setMainImage(mainImage);
        return funding;
    }

    @Override
    public void setMainImage(int code, Image image) {
        Map map = new HashMap();
        map.put("code", code);
        map.put("image", image);
        sql.update("funding.setMainImage", map);
    }
}
