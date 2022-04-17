package com.funkit.service;

import com.funkit.dao.LoginDao;
import com.funkit.exception.AlreadyExistEmailException;
import com.funkit.model.DefaultResponse;
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
    public ResponseEntity<DefaultResponse<?>> register(Member member) {
        member.setPasswd(BCrypt.hashpw(member.getPasswd(), BCrypt.gensalt()));
        //check email
        Optional<Member> user= dao.checkEmail(member.getEmail());
        if(user.isEmpty()){
            dao.register(member);
            var res = new DefaultResponse<>(HttpStatus.CREATED.value(), "회원가입 완료");
            return new ResponseEntity<>(res, HttpStatus.CREATED);
        } else{
            throw new AlreadyExistEmailException();
        }
    }

    @Override
    public ResponseEntity<String> checkId(String id) {
        boolean whether = dao.checkId(id);
        if(whether)
            return new ResponseEntity(HttpStatus.OK);
        else
            return new ResponseEntity(HttpStatus.NOT_FOUND);
    }
}
