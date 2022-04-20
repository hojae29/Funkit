package com.funkit.service;

import com.funkit.dao.LoginDao;
import com.funkit.exception.CustomException;
import com.funkit.exception.ErrorCode;
import com.funkit.model.JsonResponse;
import com.funkit.model.Member;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
public class LoginServiceImpl implements LoginService{

    final LoginDao dao;

    public LoginServiceImpl(LoginDao dao) {
        this.dao = dao;
    }

    @Override
    @Transactional
    public ResponseEntity register(Member member) {
        member.setPasswd(BCrypt.hashpw(member.getPasswd(), BCrypt.gensalt()));
        //check email
        Optional<Member> user= dao.checkId(member.getId());
        if(user.isEmpty()){
            dao.register(member);
            return new JsonResponse(HttpStatus.CREATED, "User Created").toResponseEntity();
        } else{
            throw new CustomException(ErrorCode.ALREADY_EXIST_ID);
        }
    }

    @Override
    public ResponseEntity checkId(String id) {
        Optional<Member> user = dao.checkId(id);
        if(user.isEmpty()){
            return new JsonResponse(HttpStatus.OK, "Validation OK").toResponseEntity();
        } else {
            throw new CustomException(ErrorCode.ALREADY_EXIST_ID);
        }
    }
}
