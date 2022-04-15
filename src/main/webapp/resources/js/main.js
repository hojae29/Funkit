//modal
const modal = document.getElementById("modal");
document.getElementById("login-btn").addEventListener("click", () => {
    modal.style.display = "flex";
    document.getElementById("login-form").style.display = "block";
    document.getElementById("register-form").style.display = "none";
});

document.getElementById("register-btn").addEventListener("click", () => {
    modal.style.display = "flex";
    document.getElementById("register-form").style.display = "block";
    document.getElementById("login-form").style.display = "none";
});

document.getElementById("modal-login-btn").addEventListener("click", () => {
    document.getElementById("login-form").style.display = "block";
    document.getElementById("register-form").style.display = "none";
});

document.getElementById("modal-register-btn").addEventListener("click", () => {
    document.getElementById("register-form").style.display = "block";
    document.getElementById("login-form").style.display = "none";
});

document.getElementById("modal-close").addEventListener("click", () => {
    modal.style.display = "none";
});

//id 중복체크
document.getElementById("id-check-btn").addEventListener("click", () => {
    $.ajax("/id-check?id=" + document.getElementById("id").value, {
        type: "GET",
        success: msg => {
            if(msg == "OK"){
                document.getElementById("checkId").value = document.getElementById("id").value
                alert("사용가능한 아이디 입니다");
            }
            else if(msg == "FAIL")
                alert(document.getElementById("id").value + "는 사용중인 ID입니다");
        },
        error: msg => console.log(msg)
    });
});

//유효성검사 & 회원가입
document.getElementById("submit-register-btn").addEventListener("click", () => {
    const form = document.getElementById("register-form");
    const regex_pw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
    const regex_e = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
    const regex_tel = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;

    if(form.id.value == ""){
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
    if(form.passwd.value != form.checkPasswd.value){
        alert("비밀번호 확인이 일치하지 않습니다");
        form.checkPasswd.focus();
        return false;
    }
    if(form.nickname.value == ""){
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

    const member = {
        id: document.getElementById("id").value,
        passwd: document.getElementById("passwd").value,
        nickname: document.getElementById("nickname").value,
        phone: document.getElementById("phone").value,
        email: document.getElementById("email").value,
        address: document.getElementById("address").value,
    }

    $.ajax("/register", {
        type: "POST",
        contentType: "application/json",
        dataType: "text",
        data: JSON.stringify(member),
        success: msg => alert(msg + "회원가입이 완료되었습니다"),
        error: msg => console.log(msg)
    });
});