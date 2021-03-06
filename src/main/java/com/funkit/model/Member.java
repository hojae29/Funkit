package com.funkit.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Pattern;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Member {
    @NotEmpty(message = "*아이디는 필수사항입니다")
    @Pattern(
            regexp = "^[A-za-z0-9]{4,12}$",
            message = "*아이디는 4자에서 12자 사이의 영문이어야 합니다"
    )
    private String id;

    @NotEmpty(message = "*비밀번호는 필수사항입니다")
    @Pattern(
            regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$",
            message = "*비밀번호는 하나의 문자, 숫자, 특수문자와 8자리 이상이어야 합니다"
    )
    private String passwd;

    private int typeCode;

    @NotEmpty(message = "*이름은 필수사항입니다")
    private String name;

    private String corporateName;

    private String info;

    private String phone;

    @NotEmpty(message = "*이메일은 필수사항입니다")
    @Email(message = "*올바른 이메일을 입력해주세요")
    private String email;

    private String postCode;

    private String address;

    private String detailAddress;

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

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

    public String getCorporateName() {
        return corporateName;
    }

    public void setCorporateName(String corporateName) {
        this.corporateName = corporateName;
    }

    public int getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(int typeCode) {
        this.typeCode = typeCode;
    }

    @Override
    public String toString() {
        return "Member{" +
                "id='" + id + '\'' +
                ", passwd='" + passwd + '\'' +
                ", typeCode=" + typeCode +
                ", name='" + name + '\'' +
                ", corporateName='" + corporateName + '\'' +
                ", info='" + info + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", postCode='" + postCode + '\'' +
                ", address='" + address + '\'' +
                ", detailAddress='" + detailAddress + '\'' +
                '}';
    }
}
