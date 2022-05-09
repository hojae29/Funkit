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
    public ResponseEntity individualRegister(Member member) {
        member.setPasswd(BCrypt.hashpw(member.getPasswd(), BCrypt.gensalt()));  //비밀번호 암호화
        Optional<Member> user= dao.item(member.getId());
        if(user.isEmpty()){
            dao.individualRegister(member);
            return new JsonResponse(HttpStatus.CREATED, "User Created").toResponseEntity();
        } else{
            throw new CustomException(ErrorCode.ALREADY_EXIST_ID);
        }
    }

    @Override
    public ResponseEntity checkId(String id) {
        Optional<Member> user1 = dao.item(id);
        if(user1.isEmpty()){
            return new JsonResponse(HttpStatus.OK, "Validation OK").toResponseEntity();
        } else {
            throw new CustomException(ErrorCode.ALREADY_EXIST_ID);
        }
    }

    @Override
    public Member login(Member member) {
        Optional<Member> user = dao.item(member.getId());
        if(user.isPresent() && BCrypt.checkpw(member.getPasswd(), user.get().getPasswd()))
            return user.get();
        else throw new CustomException(ErrorCode.LOGIN_FAIL);
    }
}
