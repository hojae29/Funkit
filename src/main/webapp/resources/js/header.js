//modal
const modal = document.getElementById("modal");
const delay = makeDelay(300);
const registerId = $("#register_id");
const registerPasswd = $("#register_passwd");
const registerCheckPasswd = $("#check_passwd");
const registerName = $("#name");
const registerEmail = $("#email");
const registerPhone = $("#phone");
const corporateName = $("#corporate_name");

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

registerId.on("input", () => {
    registerId.data("vst", 0);
    delay(() => {
        checkIdAjax();
    });
});

registerId.on("paste", () => {
    registerId.data("vst", 0);
    delay(() => {
        checkIdAjax();
    });
});

registerId.on("focusout ", () => {
    if(registerId.data("vst") != null){
        checkIdAjax();
    }
});

registerPasswd.on("input", () => {
    registerPasswd.data("vst", 0);
    delay(() => {
        checkPasswd(1);
    });
});

registerPasswd.on("paste", () => {
    registerPasswd.data("vst", 0);
    delay(() => {
        checkPasswd(1);
    });
});

registerPasswd.on("focusout", () => {
    if(registerPasswd.data("vst") != null) {
        checkPasswd(1);
    }
});

registerCheckPasswd.on("input", () => {
    registerCheckPasswd.data("vst", 0);
    delay(() => {
        checkPasswd(2);
    });
});

registerCheckPasswd.on("paste", () => {
    registerCheckPasswd.data("vst", 0);
    delay(() => {
        checkPasswd(2);
    });
});

registerCheckPasswd.on("focusout", () => {
    if(registerCheckPasswd.data("vst") != null){
        checkPasswd(2);
    }
});

registerName.on("input", () => {
    registerName.data("vst", 0);
    delay(() => {
        checkName();
    });
});

registerName.on("paste", () => {
    registerName.data("vst", 0);
    delay(() => {
        checkName();
    });
});

registerName.on("focusout", () => {
    if(registerName.data("vst") != null){
        checkName();
    }
});

registerEmail.on("input", () => {
    registerEmail.data("vst", 0);
    delay(() => {
        checkEmail();
    });
});

registerEmail.on("paste", () => {
    registerEmail.data("vst", 0);
    delay(() => {
        checkEmail();
    });
});

registerEmail.on("focusout", () => {
    if(registerEmail.data("vst") != null) {
        checkEmail();
    }
});

registerPhone.on("input", () => {
    registerPhone.data("vst", 0);
    delay(() => {
        checkPhone();
    });
});

registerPhone.on("paste", () => {
    registerPhone.data("vst", 0);
    delay(() => {
        checkPhone();
    });
});

registerPhone.on("focusout", () => {
    if(registerPhone.data("vst") != null) {
        checkPhone();
    }
});

corporateName.on("input", () => {
    corporateName.data("vst", 0);
    delay(() => {
        checkCorporateName();
    });
});

corporateName.on("paste", () => {
    corporateName.data("vst", 0);
    delay(() => {
        checkCorporateName();
    });
});

corporateName.on("focusout", () => {
    if(corporateName.data("vst") != null) {
        checkCorporateName();
    }
});

$("#individual_btn").on("click", () => {
   changeTab("register");
    registerTypeChange("individual");
});

$("#company_btn").on("click", () => {
    changeTab("register2");
    registerTypeChange("company");
});

function registerTypeChange(index){
    if(index === "individual"){
        $("#company_btn")
            .css("background", "none")
            .css("border", "1px solid #cccccc")
            .css("color", "black");
        $("#individual_btn")
            .css("background", "#FF7E00")
            .css("border", "#FF7E00")
            .css("color", "white");
    }else if(index === "company"){
        $("#individual_btn")
            .css("background", "none")
            .css("border", "1px solid #cccccc")
            .css("color", "black");
        $("#company_btn")
            .css("background", "#FF7E00")
            .css("border", "#FF7E00")
            .css("color", "white");
    }
}

//?????????
$("#submit_login_form").on("click", () =>{

    const member = {
        id: $("#login_id").val(),
        passwd: $("#login_passwd").val()
    }
    console.log(member);

    $.ajax({
        url: "/login",
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify(member),
        success: res => location.href = "/",
        error: res => {
            $("#login_msg").text("*????????? ??????. ?????????????????????");
        }
    });
});

//??????????????? & ????????????
$("#submit_register_form").on("click", () => {
    let code;
    if(!checkRegisterForm()) return false; //????????? ???????????? ??????

    const member = {
        id: $("#register_id").val(),
        passwd: $("#register_passwd").val(),
        name: $("#name").val(),
        email: $("#email").val(),
        phone: $("#phone").val(),
        corporateName: $("#corporate_name").val(),
        typeCode: null
    }

    //??????/?????? ?????? ??????
    if($("#register_type").text() === "company"){
        member.typeCode = 20;
        registerAjax(member);
    } else if($("#register_type").text() === "individual"){
        member.typeCode = 10;
        //???????????? ?????? ????????? ?????? ??? ???????????? ??????
        changeTab("check_email");
        $.ajax({
            type:"GET",
            url:"mail-check?email=" + member.email,
            success: res => code = res,
            error: res => console.log("???????????? ?????? ??????")
        });

        //???????????? ?????? ????????? ??????
        $("#check_token_btn").on("click", () => {
            registerAjax(member);
            //??????????????? ???????????? ??????
            if(code == $("#token").val()){
                registerAjax("/register");
                code = null;
            }else{
                $("#token").focus();
                $("#token_msg").text("*??????????????? ???????????? ????????????. ?????? ??????????????????");
            }
        });
    }
});

function registerAjax(data){
    $.ajax("/register", {
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(data),
        success: res => {
            alert("???????????? ??????");
            changeTab("login");
        },
        error: res => {
            formReset("#register_form"); //?????? ?????? ??? ??? ?????????
            changeTab("register"); //???????????? ????????? ??????
            res = res.responseJSON;
            if (res.status == 409) { // 409 = ????????? ??????
                $("#register_id_msg").text(res.message);
                registerId.data("vst", 0);
            } else if (res.status == 400) { // 400 = ?????? ??????????????? ??????
                for (const [key, value] of Object.entries(res.data)) {
                    if(key == "id")
                        $("#register_id_msg").text(value);
                    else if(key == "passwd")
                        $("#register_passwd_msg").text(value);
                    else
                        $(`#${key}_msg`).text(value);
                }
            } else alert("??? ??? ?????? ??????");
        }
    });
}

/**
 * id input ????????? ?????? ???????????? checkIdAjax()??? ??????
 * ???????????? ??????????????? ????????????????????? ??????????????? ??????????????? ???????????? JQuery Data() ????????? ??????????????? ??????
 * KEY=vst, VALUE=status (status=1 OK status=0 FAIL)
 **/
function checkIdAjax(){
    const regex_id = /^[A-za-z0-9]{4,12}$/;
    if(!regex_id.test(registerId.val())){
        registerId.data("vst", 0);
        $("#register_id_msg").text("*???????????? 4????????? 12??? ????????? ??????????????? ?????????");
        checkRegisterForm();
    } else{
        $.ajax("/id-check?id=" + registerId.val(), {
            method: "GET",
            success: () => {
                registerId.data("vst", 1);
                $("#register_id_msg").text("");
                checkRegisterForm();
            },
            error: res => {
                registerId.data("vst", 0);
                console.log(res);
                if(res.status == 500) $("#register_id_msg").text(res.responseText);
                else $("#register_id_msg").text(res.responseJSON.message);
                checkRegisterForm();
            }
        });
    }
}

function checkPasswd(index){
    const regex_pw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

    if(index === 1){
        if(!regex_pw.test(registerPasswd.val())){
            registerPasswd.data("vst", 0);
            $("#register_passwd_msg").text("*??????????????? ????????? ??????, ??????, ??????????????? 8?????? ??????????????? ?????????");
        } else{
            registerPasswd.data("vst", 1);
            $("#register_passwd_msg").text("");
        }
    } else if(index === 2){
        if(registerPasswd.val() !== registerCheckPasswd.val()){
            registerCheckPasswd.data("vst", 0);
            $("#check_passwd_msg").text("*??????????????? ???????????? ????????????. ?????? ???????????????");
        } else{
            registerCheckPasswd.data("vst", 1);
            $("#check_passwd_msg").text("");
        }
    }
    checkRegisterForm();
}

function checkName(){
    if(registerName.val() == ""){
        registerName.data("vst", 0);
        $("#name_msg").text("*????????? ?????????????????????");
    } else{
        registerName.data("vst", 1);
        $("#name_msg").text("");
    }
    checkRegisterForm();
}

function checkEmail(){
    const regex_e = /^([0-9a-zA-Z_\.-]+)@([\da-zA-Z_-]+)(\.[\da-zA-Z_-]+){1,2}$/;

    if(!regex_e.test(registerEmail.val())){
        registerEmail.data("vst", 0);
        $("#email_msg").text("*????????? ???????????? ??????????????????");
    }else{
        registerEmail.data("vst", 1);
        $("#email_msg").text("");
    }
    checkRegisterForm();
}

function checkPhone(){
    const regex_tel = /^[0-9]{3}[0-9]{3,4}[0-9]{4}$/;

    if(!regex_tel.test(registerPhone.val())){
        registerPhone.data("vst", 0);
        $("#phone_msg").text("*???????????? ????????? ??????????????????");
    }else{
        registerPhone.data("vst", 1);
        $("#phone_msg").text("");
    }
    checkRegisterForm();
}

function checkCorporateName(){
    if(corporateName.val() == ""){
        corporateName.data("vst", 0);
        $("#corporateName_msg").text("*???????????? ??????????????????");
    }else{
        corporateName.data("vst", 1);
        $("#corporateName_msg").text("");
    }
    checkRegisterForm();
}

function checkRegisterForm(){
    const type = $("#register_type").text();
    let validList =[];
    validList.push(registerId.data("vst"));
    validList.push(registerPasswd.data("vst"));
    validList.push(registerCheckPasswd.data("vst"));
    validList.push(registerName.data("vst"));
    validList.push(registerEmail.data("vst"));
    if(type === "company"){
        validList.push(registerPhone.data("vst"));
        validList.push(corporateName.data("vst"));
    }

    console.log(validList);

    //data-vst ?????? ?????? 1??? ??? ?????? ?????????
    if(!(validList.includes(0) || validList.includes(null))){
        $("#submit_register_form")
            .attr("disabled", false)
            .css("cursor", "pointer");
        return true;
    } else{
        $("#submit_register_form")
            .attr("disabled", true)
            .css("cursor", "default");
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
    $(index)[0].reset(); //??? ????????? ?????????
    $(index + " p").text(""); //??? ????????? ?????????
    $("#token_msg").text("");
    //???????????? data ?????????
    registerId.data("vst", null);
    registerPasswd.data("vst", null);
    registerCheckPasswd.data("vst", null);
    registerName.data("vst", null);
    registerEmail.data("vst", null);
    registerPhone.data("vst", null);
    corporateName.data("vst", null);
    //?????? ????????????
    $("#submit_register_form").attr("disabled", true);
}

//modal?????? ????????? ????????? ??????????????? ??????
function changeTab(index){
    const mlb = document.getElementById("modal_login_btn");
    const mrb = document.getElementById("modal_register_btn");
    const loginBtn = document.getElementById("submit_login_form");
    const loginForm = document.getElementById("login_form");
    const registerForm = document.getElementById("register_form");
    const registerBtn = document.getElementById("submit_register_form");
    const checkEmailForm = document.getElementById("check_email_form");
    const checkTokenBtn = document.getElementById("check_token_btn");
    const companyBox = document.getElementById("company_box");
    const typeBox = document.getElementById("type_box");
    $("#register_type").text("individual"); //???????????? ?????? = ??????
    registerTypeChange("individual");
    if(index === "login"){
        loginForm.style.display = "block";
        loginBtn.style.display = "block";
        registerForm.style.display = "none";
        registerBtn.style.display = "none";
        checkEmailForm.style.display = "none";
        checkTokenBtn.style.display = "none"
        mlb.style.borderBottom = "2px solid #ff7e00";
        mlb.style.color = "#ff7e00";
        mrb.style.borderBottom = "2px solid white";
        mrb.style.color = "black";
        companyBox.style.display="none";
        typeBox.style.display = "none";
        loginForm.id.focus();
        formReset("#register_form");
    } else if(index === "register"){
        registerForm.style.display = "block";
        registerBtn.style.display = "block";
        loginForm.style.display = "none";
        loginBtn.style.display = "none";
        checkTokenBtn.style.display = "none"
        checkEmailForm.style.display = "none";
        mrb.style.borderBottom ="2px solid #ff7e00";
        mrb.style.color = "#ff7e00";
        mlb.style.borderBottom = "2px solid white";
        mlb.style.color = "black";
        companyBox.style.display="none";
        typeBox.style.display = "block";
        registerForm.id.focus();
        formReset("#login_form");
    } else if(index === "register2"){
        companyBox.style.display = "block";
        $("#register_type").text("company");
        formReset("#register_form");
        registerForm.id.focus();
    } else if(index === "check_email"){
        loginForm.style.display = "none";
        loginBtn.style.display = "none";
        registerForm.style.display = "none";
        registerBtn.style.display = "none";
        checkTokenBtn.style.display = "block"
        checkEmailForm.style.display = "block";
        companyBox.style.display="none";
        typeBox.style.display = "none";
        $("#token").focus();
    }
}