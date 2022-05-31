$("#tag_add_btn").on("click", () => {
    let html = '<div class="tag_box">' + $("#tag_select option:checked").text() +
        '<button type="button" class="tag_delete_btn"><img width="10" src="/resources/img/icon/close_icon_white.svg"></button>' +
        '<input type="hidden" name="tagCode" value="' + $("#tag_select").val() + '">' +
        '</div>';

    if($("#tag_list_box input[value=" + $("#tag_select").val() + "]").length < 1)
        $("#tag_list_box").append(html);
});

$(document).on("click", ".tag_delete_btn", function(){
    $(this).closest('.tag_box').remove();
});

$("#cancel_btn").on("click", () => {
    $("#btn_box2").css("display", "none");
    $("#btn_box1").css("display", "block");
    rewardFormReset();
});

//리워드 삭제 버튼
$(document).on("click", ".reward_delete_btn", function(){
    let rewardCode = $(this).closest('.reward_box').data("code");
    console.log($(this).closest('.reward_box'));
    console.log(rewardCode);

    $.ajax({
        url: window.location.pathname + "/reward?code=" + rewardCode,
        method: "DELETE",
        success: () => $(this).closest('.reward_box').remove(),
        error: error => console.log(error)
    });
});

//리워드 수정 버튼
$(document).on("click", "#reward_modify_submit_btn", function(){
    let reward = {
        rewardCode: $("#reward_form #reward_code").val(),
        title: $("#reward_form #title").val(),
        info: $("#reward_form #info").val(),
        amount: Number($("#reward_form #amount").val()),
        delivery: Number($("#reward_form #delivery").val()),
        quantity: Number($("#reward_form #quantity").val())
    }

    $.ajax({
        url: window.location.pathname + "/reward",
        method: "PATCH",
        data: JSON.stringify(reward),
        contentType: "application/json",
        success: result => {
            const selector = ".reward_box[data-code=" + result.data.rewardCode +"]";
            $(selector + " .amount").text(result.data.amount + "원");
            $(selector + " .info").text(result.data.info);
            $(selector + " .quantity").text("제한수량 " + result.data.quantity + "개");
            $(selector + " .title").text(result.data.title);
            $(selector + " .delivery").text(result.data.delivery);
        },
        error: error => console.log(error)
    });
});

//리워드 수정 버튼
$(document).on("click", ".reward_modify_btn", function(){
    let rewardCode = $(this).closest('.reward_box').data("code");
    $.ajax({
        url: window.location.pathname + "/reward?code=" + rewardCode,
        method: "GET",
        success: result => {
            console.log(result.data);
            $("#reward_form #reward_code").val(result.data.rewardCode);
            $("#reward_form #title").val(result.data.title);
            $("#reward_form #info").val(result.data.info);
            $("#reward_form #amount").val(result.data.amount);
            $("#reward_form #delivery").val(result.data.delivery);
            $("#reward_form #quantity").val(result.data.quantity);

            $("#btn_box2").css("display", "block");
            $("#btn_box1").css("display", "none");
        },
        error: error => console.log(error)
    });
});

//리워드 등록 버튼
$("#add_reward_btn").on("click", () => {
    let reward = {
        title: $("#reward_form #title").val(),
        info: $("#reward_form #info").val(),
        amount: Number($("#reward_form #amount").val()),
        delivery: Number($("#reward_form #delivery").val()),
        quantity: Number($("#reward_form #quantity").val())
    }

    $.ajax({
        url: window.location.pathname + "/reward",
        method: "POST",
        data: JSON.stringify(reward),
        contentType: "application/json",
        success: result => {
            let html = '<div data-code="' + result.data.rewardCode + '" class="reward_box">' +
                '<div>'+ result.data.amount +'원</div>' +
                '<div>' +
                '<div>리워드명</div>' +
                '<div>' + result.data.title + '</div>' +
                '</div>' +
                '<div>' + result.data.info + '</div>' +
                '<div>' +
                '<div>배송비</div>' +
                '<div>' + result.data.delivery + '원</div>' +
                '</div>' +
                '<div>제한수량 ' + result.data.quantity + '개</div>' +
                '<div>' +
                '<button type="button" class="reward_btn reward_modify_btn"><img width="15" height="15" src="/resources/img/icon/modify_icon.svg"/> 수정</button>' +
                '<button type="button" class="reward_btn reward_delete_btn"><img width="15" height="15" src="/resources/img/icon/delete_icon_red.svg"/> 삭제</button>' +
                '</div>' +
                '</div>';

            $(".reward_container").append(html);
        },
        error: error => console.log(error)
    });
});

//리워드 초기화 버튼
$("#reset_reward_btn").on("click", () => {
    rewardFormReset();
});

$(document).on('mouseenter', '.file_upload_box', function() {
    $(this).children('div').css('display','block');
});

$(document).on('mouseleave', '.file_upload_box', function() {
    $(this).children('div').css('display','none');
});

$(document).on("click", ".update_icon", function(){
    $(this).closest('.file_upload_box').prev().click();
});

$(document).on("click", ".delete_icon", function(){
    deleteImage($(this).closest('.info_img_box').data("uuid"));
    $(this).closest('.info_img_box').remove();
});


//왼쪽 사이드 메뉴 클릭 이벤트
$("#side_menu > li:nth-child(1)").on("click", () => {
    changeForm("basicForm");
});
$("#side_menu > li:nth-child(2)").on("click", () => {
    changeForm("storyForm");
});
$("#side_menu > li:nth-child(3)").on("click", () => {
    changeForm("rewardForm");
});

//저장 버튼
$("#save_btn").on("click", () => {
    let formData = new FormData($("#add_form")[0]);

    $.ajax({
        url: window.location.pathname,
        type: "POST",
        enctype: 'multipart/form-data',
        data: formData,
        processData: false,
        contentType: false,
        cache: false,
        success: result => alert("저장되었습니다"),
        error: error => alert(error.message)
    });
});

//다음 버튼
$("#next_btn").on("click", () => {
    let formType = $("#form_type").data("form");
    if(formType === 1){
        changeForm("storyForm");
    }
    if(formType === 2){
        changeForm("rewardForm");
    }
});

// input file 추가
$("#add_input").on("click", () => {
    let html = '<div class="info_img_box">' +
        '<input onchange="readURL(this);" style="display: none" type="file" accept="image/jpeg, image/jpg, image/png">' +
        '<div class="file_upload_box">' +
        '<div style="display: none">' +
        '<button class="update_icon" type="button">' +
        '<img width="15" height="15" src="/resources/img/icon/upload-icon.png"/>변경' +
        '</button>' +
        '<button class="delete_icon" type="button">' +
        '<img width="15" height="15" src="/resources/img/icon/delete_icon_whtie.png"/>삭제' +
        '</button>' +
        '</div>' +
        '</div>' +
        '</div>';

    if($(".info_img_box > input").length === 0){
        $("#info_img_wrap > div:last").before(html);
    }

    if($(".info_img_box:last").prev().css("background-image") !== "none"){
        $("#info_img_wrap > div:last").before(html);
    }
});


function changeForm(name) {
    if (name === "basicForm") {
        $("#menu_title").text("기본정보");
        $("#basic_form").css("display", "block");
        $("#story_form").css("display", "none");
        $("#reward_form").css("display", "none");
        $("#form_type").data("form", 1);
        $("#side_menu > li:nth-child(1)").css("color", "#ff7e00").css("border-left", "3px solid #ff7e00");
        $("#side_menu > li:nth-child(2)").css("color", "black").css("border-left", "none");
        $("#side_menu > li:nth-child(3)").css("color", "black").css("border-left", "none");
    } else if (name === "storyForm") {
        $("#menu_title").text("스토리");
        $("#basic_form").css("display", "none");
        $("#story_form").css("display", "block");
        $("#reward_form").css("display", "none");
        $("#side_menu > li:nth-child(1)").css("color", "black").css("border-left", "none");
        $("#side_menu > li:nth-child(2)").css("color", "#ff7e00").css("border-left", "3px solid #ff7e00");
        $("#side_menu > li:nth-child(3)").css("color", "black").css("border-left", "none");
    } else if (name === "rewardForm") {
        $("#menu_title").text("리워드 설계");
        $("#story_form").css("display", "none");
        $("#basic_form").css("display", "none");
        $("#reward_form").css("display", "block");
        $("#form_type").data("form", 2);
        $("#side_menu > li:nth-child(1)").css("color", "black").css("border-left", "none");
        $("#side_menu > li:nth-child(2)").css("color", "black").css("border-left", "none");
        $("#side_menu > li:nth-child(3)").css("color", "ff7e00").css("border-left", "3px solid #ff7e00");
    }
}

function deleteImage(fileName){
    let html = '<input type="hidden" name="deleteImages" value="' + fileName + '">'
    if($("input[value='" + fileName +"']").length < 1)
        $("#info_img_wrap").append(html);
}

//미리보기
function readURL(input){
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function (e) {
            $(input).closest('div').css("background-image", "url('" + e.target.result + "')");
            if($(input).closest('div').attr("id") === "title_img_box"){
                $(input).attr("name", "mainImage");
            } else{
                $(input).attr("name", "infoImage");
            }
        };
        reader.readAsDataURL(input.files[0]);
    }else{
        let fileName = $(input).closest('div').data('uuid');

        if($(input).closest('div').attr("id") === "title_img_box"){
            $(input).closest('div').css("background-image", "url('${funding.mainImage.location}${funding.mainImage.name}')");
        } else{
            $(input).closest('div').css("background-image", "url('/upload/${funding.fundingCode}/infoImage/" + fileName + "')");
        }
        $(input).removeAttr("name");
    }
}

function rewardFormReset(){
    $("#reward_form #reward_code").val("");
    $("#reward_form #title").val("");
    $("#reward_form #info").val("");
    $("#reward_form #amount").val("");
    $("#reward_form #delivery").val("");
    $("#reward_form #quantity").val("");
}