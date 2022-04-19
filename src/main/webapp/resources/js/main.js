//modal
const modal = document.getElementById("modal");
$("#login_btn").on("click", () => {
    modal.style.display = "flex";
    changeTab("login");
});

$("#register_btn").on("click", () => {
    modal.style.display = "flex";
    changeTab("register");
});

$("#modal_close").on("click", () => {
    modal.style.display = "none";
    formReset("#login_form");
    formReset("#register_form");
});

$("#modal_login_btn").on("click", () => {
    changeTab("login");
});

$("#modal_register_btn").on("click", () => {
    changeTab("register");
});

const delay = makeDelay(300);
const registerId = $("#register_id");

registerId.on("keyup", () => {
    delay(() => checkIdAjax());
});

registerId.on("paste", () => {
    delay(() => checkIdAjax());
});

//focusout 이벤트 발생시 아이디검증여부가 저장되어 있을때만 실행
registerId.on("focusout ", () => {
    if(registerId.data("vst") != null) checkIdAjax();
});

//유효성검사 & 회원가입
document.getElementById("submit_register_form").addEventListener("click", () => {
    const form = document.getElementById("register_form");

    //최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자
    const regex_pw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
    const regex_e = /^([0-9a-zA-Z_\.-]+)@([\da-zA-Z_-]+)(\.[\da-zA-Z_-]+){1,2}$/;
    const regex_tel = /^(01[016789]{1}|02|0[3-9]{1}\d{1})-?\d{3,4}-?\d{4}$/;

    if (form.checkId.value == "") {
        alert("아이디 중복검사를 해주세요");
        return false;
    }
    if (form.id.value != form.checkId.value) {
        alert("아이디 중복검사를 다시 해주세요");
        return false;
    }
    if (form.passwd.value == "") {
        alert("비밀번호를 입력해주세요");
        form.passwd.focus();
        return false;
    }
    if (!regex_pw.test(form.passwd.value)) {
        alert("비밀번호 형식이 맞지 않습니다(최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자)");
        form.passwd.focus();
        return false;
    }
    if (form.checkPasswd.value == "") {
        alert("비밀번호 확인을 입력해주세요");
        form.checkPasswd.focus();
        return false;
    }
    if (form.passwd.value != form.checkPasswd.value) {
        alert("비밀번호 확인이 일치하지 않습니다");
        form.checkPasswd.focus();
        return false;
    }
    if (form.name.value == "") {
        alert("이름을 입력해주세요");
        form.name.focus();
        return false;
    }
    if (form.nickName.value == "") {
        alert("닉네임을 입력해주세요");
        form.nickname.focus();
        return false;
    }
    if (form.phone.value == "") {
        alert("전화번호를 입력해주세요");
        form.phone.focus();
        return false;
    }
    if (!regex_tel.test(form.phone.value)) {
        alert("전화번호 형식을 확인해주세요");
        form.phone.focus();
        return false;
    }
    if (form.email.value == "") {
        alert("이메일을 입력해주세요");
        form.email.focus();
        return false;
    }
    if (!regex_e.test(form.email.value)) {
        alert("잘못된 이메일 형식입니다");
        form.email.focus();
        return false;
    }
    if (form.postCode.value == "" || form.address.value == "") {
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
            if (res.status == 409) {
                alert(res.message);
            } else if (res.status == 400) {
                for (const [key, value] of Object.entries(res.data)) {
                    console.log(`${key} : ${value}`);
                }
            }
        }
    });
});

/**
 * id input 태그의 모든 이벤트는 checkIdAjax()를 실행
 * 정규식을 통과한후에 비동기통신으로 사용가능한 아이디인지 판별하여 JQuery Data() 함수로 검증여부를 저장
 * KEY=vst, VALUE=status (status=1 OK status=0 FAIL)
 **/
function checkIdAjax(){
    const regex_id = /^[A-za-z0-9]{4,12}$/;
    if(!regex_id.test(registerId.val())){
        registerId.data("vst", "0");
        $("#id_msg").text("*아이디는 4자에서 12자 사이의 영문이어야 합니다");
    } else{
        $.ajax("/id-check?id=" + registerId.val(), {
            method: "GET",
            success: () => {
                registerId.data("vst", "1");
                $("#id_msg").text("");
            },
            error: res => {
                registerId.data("vst", "0");
                console.log(res);
                if(res.status == 500)
                    $("#id_msg").text(res.responseText);
                else
                    $("#id_msg").text(res.responseJSON.message);
            }
        });
    }
}

function makeDelay(ms) {
    let timer = 0;
    return function(callback){
        clearTimeout (timer);
        timer = setTimeout(callback, ms);
    };
}

function formReset(index){
    $(index)[0].reset(); //폼 초기화
    $(index + " p").text(""); //폼 메세지 초기화
    registerId.data("vst", null); //검증여부 data 초기화
}

//modal창을 열거나 창에서 메뉴이동시 실행
function changeTab(index){
    const mlb = document.getElementById("modal_login_btn");
    const mrb = document.getElementById("modal_register_btn");
    const registerBtn = document.getElementById("submit_register_form");
    const loginBtn = document.getElementById("submit_login_form");
    const loginForm = document.getElementById("login_form");
    const registerForm = document.getElementById("register_form");

    if(index === "login"){
        loginForm.style.display = "block";
        loginBtn.style.display = "block";
        registerForm.style.display = "none";
        registerBtn.style.display = "none";
        mlb.style.borderBottom = "2px solid #ff7e00";
        mlb.style.color = "#ff7e00";
        mrb.style.borderBottom = "2px solid white";
        mrb.style.color = "black";
        loginForm.id.focus();
        formReset("#register_form");
    } else if(index === "register"){
        registerForm.style.display = "block";
        registerBtn.style.display = "block";
        loginForm.style.display = "none";
        loginBtn.style.display = "none";
        mrb.style.borderBottom ="2px solid #ff7e00";
        mrb.style.color = "#ff7e00";
        mlb.style.borderBottom = "2px solid white";
        mlb.style.color = "black";
        registerForm.id.focus();
        formReset("#login_form");
    }
}

