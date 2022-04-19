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

    //최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자
    const regex_pw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
    const regex_e = /^([0-9a-zA-Z_\.-]+)@([\da-zA-Z_-]+)(\.[\da-zA-Z_-]+){1,2}$/;
    const regex_tel = /^(01[016789]{1}|02|0[3-9]{1}\d{1})-?\d{3,4}-?\d{4}$/;
    //4 ~ 12자리 영문
    const regex_id = /{^[A-za-z\d]{4,12}$/;

    if(form.id.value === ""){
        alert("아이디를 입력해주세요");
        form.id.focus();
        return false;
    }
    if(!regex_id.test(form.id.value)){
        alert("아이디는 4~12자리 영문으로 입력해야 합니다");
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
        alert("비밀번호 형식이 맞지 않습니다(최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자)");
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
    if(form.name.value == ""){
        alert("이름을 입력해주세요");
        form.name.focus();
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
        alert("잘못된 이메일 형식입니다");
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
        error: res => {
            res = res.responseJSON;
            console.log(res);
            if(res.status == 409){
                alert(res.message);
            }else if(res.status == 400){
                for (const [key, value] of Object.entries(res.data)) {
                    console.log(`${key} : ${value}`);
                }
            }
        }
    });

    //폼 데이터 초기화 코드
    // form.checkId.value = "";
    // form.reset();
});