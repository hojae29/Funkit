package com.funkit.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class Member {
    @NotEmpty(message = "아이디를 입력해주세요")
    @Pattern(
            regexp = "^[A-za-z0-9]{4,12}$",
            message = "아이디는 4~12자리 영문으로 입력해야 합니다"
    )
    private String id;

    @NotEmpty(message = "비밀번호를 입력해주세요")
    @Pattern(
            regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$",
            message = "비밀번호 형식이 맞지 않습니다(최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자)"
    )
    private String passwd;

    @NotEmpty(message = "이름을 입력해주세요")
    private String name;

    @NotEmpty(message = "닉네임을 입력해주세요")
    @Size(max = 8, message = "닉네임은 8자리이하여야 합니다")
    private String nickName;

    @NotEmpty(message = "전화번호를 입력해주세요")
    @Pattern(
            regexp = "^(01[016789]{1}|02|0[3-9]{1}\\d{1})-?\\d{3,4}-?\\d{4}$",
            message = "잘못된 전화번호 형식입니다"
    )
    private String phone;

    @NotEmpty(message = "이메일을 입력해주세요")
    @Email(message = "잘못된 이메일 형식입니다")
    private String email;

    @NotEmpty(message = "주소를 입력해주세요")
    private String postCode;

    @NotEmpty(message = "주소를 입력해주세요")
    private String address;

    private String detailAddress;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }
}
