//modal
const modal = document.getElementById("modal");
const delay = makeDelay(300);
const registerId = $("#register_id");
const registerPasswd = $("#register_passwd");
const registerCheckPasswd = $("#check_passwd");
const registerName = $("#name");
const registerEmail = $("#email");

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

registerId.on("keyup", () => {
    delay(() => {
        checkIdAjax();
        checkRegisterForm();
    });
});

registerId.on("paste", () => {
    delay(() => {
        checkIdAjax();
        checkRegisterForm();
    });
});

registerId.on("focusout ", () => {
    if(registerId.data("vst") != null){
        checkIdAjax();
        checkRegisterForm();
    }
});

registerPasswd.on("keyup", () => {
    delay(() => {
        checkPasswd(1);
        checkRegisterForm();
    });
});

registerPasswd.on("paste", () => {
    delay(() => {
        checkPasswd(1);
        checkRegisterForm();
    });
});

registerPasswd.on("focusout", () => {
    if(registerPasswd.data("vst") != null) {
        checkPasswd(1);
        checkRegisterForm();
    }
});

registerCheckPasswd.on("keyup", () => {
    delay(() => {
        checkPasswd(2);
        checkRegisterForm();
    });
});

registerCheckPasswd.on("paste", () => {
    delay(() => {
        checkPasswd(2);
        checkRegisterForm();
    });
});

registerCheckPasswd.on("focusout", () => {
    if(registerCheckPasswd.data("vst") != null){
        checkPasswd(2);
        checkRegisterForm();
    }
});

registerName.on("keyup", () => {
    delay(() => {
        checkName();
        checkRegisterForm();
    });
});

registerName.on("paste", () => {
    delay(() => {
        checkName();
        checkRegisterForm();
    });
});

registerName.on("focusout", () => {
    if(registerName.data("vst") != null){
        checkName();
        checkRegisterForm();
    }
});

registerEmail.on("keyup", () => {
    delay(() => {
        checkEmail();
        checkRegisterForm();
    });
});

registerEmail.on("paste", () => {
    delay(() => {
        checkEmail();
        checkRegisterForm();
    });
});

registerEmail.on("focusout", () => {
    if(registerEmail.data("vst") != null) {
        checkEmail();
        checkRegisterForm();
    }
});

//유효성검사 & 회원가입
$("#submit_register_form").on("click", () => {

    const member = {
        id: $("#register_id").val(),
        passwd: $("#register_passwd").val(),
        name: $("#name").val(),
        email: $("#email").val()
    }

    console.log(member);

    $.ajax("/register", {
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(member),
        success: res => {
            alert(res.message);
            changeTab("login");
        },
        error: res => {
            res = res.responseJSON;
            if (res.status == 409) {
                alert(res.message);
            } else if (res.status == 400) {
                for (const [key, value] of Object.entries(res.data)) {
                    if(key == "id") $("#register_id_msg").text(value);
                    else if(key == "passwd") $("#register_passwd_msg").text(value);
                    else $(`#${key}_msg`).text(value);
                }
            }
            $("#submit_register_form").attr("disabled", true);
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
        registerId.data("vst", 0);
        $("#register_id_msg").text("*아이디는 4자에서 12자 사이의 영문이어야 합니다");
    } else{
        $.ajax("/id-check?id=" + registerId.val(), {
            method: "GET",
            success: () => {
                registerId.data("vst", 1);
                $("#register_id_msg").text("");
            },
            error: res => {
                registerId.data("vst", 0);
                console.log(res);
                if(res.status == 500) $("#register_id_msg").text(res.responseText);
                else $("#register_id_msg").text(res.responseJSON.message);
            }
        });
    }
}

function checkPasswd(index){
    const regex_pw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

    if(index === 1){
        if(!regex_pw.test(registerPasswd.val())){
            registerPasswd.data("vst", 0);
            $("#register_passwd_msg").text("*비밀번호는 하나의 문자, 숫자, 특수문자와 8자리 이상이어야 합니다");
        } else{
            registerPasswd.data("vst", 1);
            $("#register_passwd_msg").text("");
        }
    } else if(index === 2){
        if(registerPasswd.val() !== registerCheckPasswd.val()){
            registerCheckPasswd.data("vst", 0);
            $("#check_passwd_msg").text("*비밀번호가 일치하지 않습니다. 다시 시도하세요");
        } else{
            registerCheckPasswd.data("vst", 1);
            $("#check_passwd_msg").text("");
        }
    }
}

function checkName(){
    if(registerName.val() == ""){
        registerName.data("vst", 0);
        $("#name_msg").text("*이름은 필수사항입니다");
    } else{
        registerName.data("vst", 1);
        $("#name_msg").text("");
    }
}

function checkEmail(){
    const regex_e = /^([0-9a-zA-Z_\.-]+)@([\da-zA-Z_-]+)(\.[\da-zA-Z_-]+){1,2}$/;

    if(!regex_e.test(registerEmail.val())){
        registerEmail.data("vst", 0);
        $("#email_msg").text("*올바른 이메일을 입력해주세요");
    }else{
        registerEmail.data("vst", 1);
        $("#email_msg").text("");
    }
}

function checkRegisterForm(){
    let validList = [];
    validList.push(registerId.data("vst"));
    validList.push(registerPasswd.data("vst"));
    validList.push(registerCheckPasswd.data("vst"));
    validList.push(registerName.data("vst"));
    validList.push(registerEmail.data("vst"));

    //유효성검사 성공시 버튼 활성화
    if(!(validList.includes(0) || validList.includes(null))){
        $("#submit_register_form").attr("disabled", false);
    } else{
        $("#submit_register_form").attr("disabled", true);
        return false;
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
    //검증여부 data 초기화
    registerId.data("vst", null);
    registerPasswd.data("vst", null);
    registerCheckPasswd.data("vst", null);
    registerName.data("vst", null);
    registerEmail.data("vst", null);
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

