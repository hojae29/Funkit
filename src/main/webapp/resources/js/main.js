//modal
const modal = document.getElementById("modal");
const loginForm = document.getElementById("login_form");
const registerForm = document.getElementById("register_form");

document.getElementById("login_btn").addEventListener("click", () => {
    modal.style.display = "flex";
    loginForm.style.display = "block";
    registerForm.style.display = "none";
});

document.getElementById("register_btn").addEventListener("click", () => {
    modal.style.display = "flex";
    registerForm.style.display = "block";
    loginForm.style.display = "none";
});

document.getElementById("modal_login_btn").addEventListener("click", () => {
    loginForm.style.display = "block";
    registerForm.style.display = "none";
});

document.getElementById("modal_register_btn").addEventListener("click", () => {
    registerForm.style.display = "block";
    loginForm.style.display = "none";
});

document.getElementById("modal_close").addEventListener("click", () => {
    modal.style.display = "none";
});

//id 중복체크
document.getElementById("check_id_btn").addEventListener("click", () => {
    const form = document.getElementById("register_form");
    $.ajax("/id-check?id=" + form.id.value, {
        type: "GET",
        success: res => {
            form.checkId.value = form.id.value;
            alert(res.message);
        },
        error: res => alert(res.responseJSON.message)
    });
});

//유효성검사 & 회원가입
document.getElementById("submit_register_btn").addEventListener("click", () => {
    const form = document.getElementById("register_form");

    const regex_pw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
    const regex_e = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
    const regex_tel = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;

    if(form.id.value === ""){
        alert("아이디를 입력해주세요");
        form.id.focus();
        return false;
    }
    if(form.checkId.value == ""){
        alert("아이디 중복검사를 해주세요");
        return false;
    }
    if(form.id.value != form.checkId.value) {
        alert("아이디 중복검사를 다시 해주세요");
        return false;
    }
    if(form.passwd.value == ""){
        alert("비밀번호를 입력해주세요");
        form.passwd.focus();
        return false;
    }
    if(!regex_pw.test(form.passwd.value)){
        alert("비밀번호 형식을 확인해주세요");
        form.passwd.focus();
        return false;
    }
    if(form.checkPasswd.value == ""){
        alert("비밀번호 확인을 입력해주세요");
        form.checkPasswd.focus();
        return false;
    }
    if(form.name.value == ""){
        alert("이름을 입력해주세요");
        form.name.focus();
        return false;
    }
    if(form.passwd.value != form.checkPasswd.value){
        alert("비밀번호 확인이 일치하지 않습니다");
        form.checkPasswd.focus();
        return false;
    }
    if(form.nickName.value == ""){
        alert("닉네임을 입력해주세요");
        form.nickname.focus();
        return false;
    }
    if(form.phone.value == ""){
        alert("전화번호를 입력해주세요");
        form.phone.focus();
        return false;
    }
    if(!regex_tel.test(form.phone.value)){
        alert("전화번호 형식을 확인해주세요");
        form.phone.focus();
        return false;
    }
    if(form.email.value == ""){
        alert("이메일을 입력해주세요");
        form.email.focus();
        return false;
    }
    if(!regex_e.test(form.email.value)){
        alert("이메일 형식을 확인해주세요");
        form.email.focus();
        return false;
    }
    if(form.postCode.value == "" || form.address.value == ""){
        alert("주소를 입력해주세요");
        return false;
    }

    const member = {
        id: form.id.value,
        passwd: form.passwd.value,
        name: form.name.value,
        nickName: form.nickName.value,
        phone: form.phone.value,
        email: form.email.value,
        postCode: form.postCode.value,
        address: form.address.value,
        detailAddress: form.detailAddress.value
    }

    $.ajax("/register", {
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(member),
        success: res => alert(res.message),
        error: res => alert(res.responseJSON.message)
    });

    //form data reset
    form.checkId.value = "";
    form.reset();
});