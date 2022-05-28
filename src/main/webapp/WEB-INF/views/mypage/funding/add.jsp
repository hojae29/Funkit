<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-05-16
  Time: 오후 3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>펀키트</title>
    <style>
        .top_box{
            width: 100%;
            height: 160px;
            background: #efefef;
            display: flex;
            justify-content: center;
            margin-bottom: 70px;

        }
        .container{
            width:100%;
            display: flex;
            justify-content: center;
            flex-direction: column;
        }
        .top_content_box{
            width: 980px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .menu_box a{
            font-size: 14px;
            color: #888888;
            text-decoration: none;
        }
        .menu_box a:nth-child(2){
            margin-left: 16px;
        }

        #approval_btn{
            padding:6px 25px;
            border: none;
            background: #ff7e00;
            color: white;
            border-radius: 5px;
            font-size: 16px;
        }

        .bottom_box{
            width: 100%;
            display: flex;
            justify-content: center;
        }
        .side_menu_box{
            width: 180px;
            margin-right: 20px;
        }
        .form_box{
            width: 800px;
        }

        .form_box p{
            color: #888888;
            font-size: 14px;
            margin-bottom: 4px;
        }

        .form_box label{
            font-size: 18px;
            font-weight: 500;
        }

        #menu_title{
            color: #ff7e00;
            font-size: 26px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .text_input{
            width: 500px;
            height: 30px;
            border: 1px solid #cccccc;
            background: white;
        }
        .date_input{
            width: 100px;
            height: 30px;
            background: white;
            border: 1px solid #cccccc;
        }

        #basic_form > div{
            margin-bottom:20px;
        }

        #story_form > div{
            margin-bottom:20px;
        }

        #reward_form > div{
            margin-bottom:20px;
        }

        #title_img_box{
            width: 350px;
            height:210px;
            border: 1px solid #cccccc;
            background-size: cover;
        }

        .file_upload_box {
            display: flex;
            align-content: center;
            justify-content: center;
            height: 100%;
            align-items: center;
        }
        .file_upload_box:hover{
            background-color: rgba(0, 0, 0, 0.5);
        }

        #save_btn{
            width: 90px;
            height: 30px;
            color: #ff7e00;
            border: 1px solid #ff7e00;
            background: white;
            border-radius: 5px;
            font-size:14px;
        }

        #next_btn{
            width: 90px;
            height: 30px;
            color: white;
            border: 1px solid #ff7e00;
            background: #ff7e00;
            border-radius: 5px;
            font-size:14px;
        }
        #side_menu > li {
            font-size: 18px;
            font-weight: 500;
            margin-bottom: 15px;
            cursor: pointer;
            padding-left: 10px;
        }

        .info_img_box{
            width: 180px;
            height:120px;
            border: 1px solid #cccccc;
            background-size: cover;
            margin-right: 15px;
            margin-bottom: 15px;
            position: relative;
        }

        #info_img_wrap{
            display: flex;
            flex-wrap: wrap;
            flex-direction: row;
        }
        .file_upload_box button{
            padding: 3px;
            color: white;
            background: none;
            border: 1px solid white;
        }

        .file_upload_box button:hover {
            background: #cccccc;
            border: 1px solid #cccccc;
        }

        .file_upload_box button{
            margin: 0px 3px;
        }

        #reward_form > div:nth-child(2) > div {
            margin-bottom: 15px;
        }
        #reward_form > div:nth-child(2) {
            width: 610px;
            padding: 20px 30px;
            background-color: #efefef;
        }
        #reward_form > div:nth-child(2) > div {
            display: flex;
            justify-content: space-between;
        }

        #reward_form > div:nth-child(2) > div:last-child {
            justify-content: normal;
            margin-bottom: 0;
        }

        #reward_form .text_input{
            width:400px
        }

        #reward_form_box button{
            padding: 4px 28px;
            background-color: white;
            border: 1px solid #ff7e00;
            font-size: 14px;
            color: #ff7e00;
        }

        #reward_form button:nth-child(1){
            margin-right: 10px;
        }

        .reward_box{
            width: 230px;
            height: 330px;
            background: none;
            padding: 8px;
            border: 1px solid #E2E2E2;
            margin-right: 20px;
            margin-bottom: 20px;
        }

        .reward_container {
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
        }

        .reward_box > div:nth-child(1){
            font-size: 16px;
            font-weight: 600;
        }

        .reward_box > div:nth-child(2) div{
            font-size: 14px;
            color: #888888;
        }

        .reward_box > div:nth-child(2) div:nth-child(2){
            font-size: 14px;
            color: black;
        }

        .reward_box > div:nth-child(3){
            font-size: 14px;
            color: #888888;
        }

        .reward_box > div:nth-child(4){
            font-size: 14px;
            color: #888888;
        }

        .reward_box > div:nth-child(5){
            font-size: 14px;
            color: #ff7e00;
        }

        .reward_btn{
            border: none;
            color: red ;
            margin-right: 10px;
            padding: 4px 10px;
            background: none;
        }

        .reward_btn:hover{
            color: darkred;
        }

        .tag_box{
            border: none;
            background: #ff7e00;
            color: white;
            padding: 6px 12px;
            border-radius: 10px;
            font-size: 14px;
            margin-right: 8px;
            margin-bottom: 8px;
        }

        #tag_list_box{
            margin-top: 8px;
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            justify-content: flex-start;
        }

        .tag_delete_btn{
            background: none;
            border:none;
            color: white;
            font-weight: bold;
            margin-left: 5px;
        }

        #tag_add_btn{
            height: 30px;
            width: 60px;
            font-size: 14px;
            background: none;
            border: 1px solid #ff7e00;
            border-radius: 5px;
            margin-left: 8px;
            color: #ff7e00;
        }

        #tag_select{
            width: 70px;
            height: 30px;
            border: 1px solid #cccccc;
            background: white;
        }

    </style>
</head>
<body>
    <jsp:include page="../../header.jsp"/>
    <div></div>
    <div class="container">
        <div class="top_box">
            <div class="top_content_box">
                <div>
                    <h1>${member.corporateName}님의 프로젝트</h1>
                </div>
                <div class="menu_box">
                    <button id="approval_btn"><a style="font-size: 16px;color: white;" href="${funding.fundingCode}/approval?status=20">승인 요청하기</a></button>
                </div>
            </div>
        </div>
        <div class="bottom_box">
            <div class="side_menu_box">
                <ul id="side_menu">
                    <li style="color:#ff7e00">1. 기본정보</li>
                    <li>2. 스토리</li>
                    <li>3. 리워드 설계</li>
                </ul>
            </div>
            <div class="form_box">
                <div id="form_type" data-form="1">
                    <div><p id="menu_title">기본정보</p></div>
                    <form id="add_form" method="post" enctype="multipart/form-data">
                        <div id="basic_form">
                            <div>
                                <div><label>프로젝트 제목</label></div>
                                <div><p>프로젝트를 표현할 수 있는 제목을 입력해주세요</p></div>
                                <div><input class="text_input" name="title" type="text" value="${funding.title}"></div>
                            </div>
                            <div>
                                <div><label>목표 금액</label></div>
                                <div><p>프로젝트의 펀딩 목표금액을 입력해주세요</p></div>
                                <div><input class="text_input" name="targetAmount" type="text" value="${funding.targetAmount}"></div>
                            </div>
                            <div>
                                <div><label>진행기간</label></div>
                                <div><p>프로젝트 진행기간을 설정해주세요</p></div>
                                <div>
                                    <input class="date_input" name="startDate" type="date" value="<fmt:formatDate value="${funding.startDate}" pattern="yyyy-MM-dd"/>">
                                    <input class="date_input" name="expDate" type="date" value="<fmt:formatDate value="${funding.expDate}" pattern="yyyy-MM-dd"/>">
                                </div>
                            </div>
                            <div>
                                <div><label>태그선택</label></div>
                                <div><p>태그를 선택해주세요</p></div>
                                <div>
                                    <select id="tag_select">
                                        <c:forEach var="tag" items="${tagList}">
                                            <option value="${tag.tagCode}">${tag.name}</option>
                                        </c:forEach>
                                    </select>
                                    <button type="button" id="tag_add_btn">추가</button>
                                </div>
                                <div id="tag_list_box">
                                </div>
                            </div>
                            <div>
                                <div><label>대표 이미지</label></div>
                                <div><p>프로젝트의 대표 이미지를 등록해주세요</p></div>
                                <div id="title_img_box" data-uuid="${funding.mainImage.name}" style="background-image: url('${funding.mainImage.location}${funding.mainImage.name}')">
                                    <input type="file" accept="image/jpeg, image/jpg, image/png" style="display: none" onchange="readURL(this);">
                                    <div class="file_upload_box">
                                        <div style="display: none">
                                            <button class="update_icon" type="button">
                                                <img width="15" height="15" src="/resources/img/icon/upload-icon.png"/>변경
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="story_form" style="display: none">
                            <div>
                                <div><label>이미지 등록</label></div>
                                <div><p>프로젝트의 이미지를 등록해주세요</p></div>
                                <div id="info_img_wrap">
                                <c:forEach var="image" items="${funding.infoImage}">
                                    <div data-uuid="${image.name}" class="info_img_box" style="background-image: url('${image.location}${image.name}')">
                                        <input style="display: none"
                                               type="file"
                                               accept="image/jpeg, image/jpg, image/png"
                                               onchange="readURL(this);">
                                        <div class="file_upload_box">
                                            <div style="display: none">
                                                <button class="update_icon" type="button">
                                                    <img width="15" height="15" src="/resources/img/icon/upload-icon.png"/>변경
                                                </button><button class="delete_icon" type="button">
                                                    <img width="15" height="15" src="/resources/img/icon/delete_icon_whtie.png"/>삭제
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                    <div class="info_img_box" style="display: flex;align-items: center;justify-content: center;">
                                        <button type="button" id="add_input" style="background: none;border: none;">
                                            <img src="/resources/img/icon/add_icon.svg">
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div><label>간단 소개글</label></div>
                                <div><p>간단한 소개글을 적어주세요</p></div>
                                <div><input type="text" class="text_input" name="introduction" value="${funding.introduction}"></div>
                            </div>
                            <div>
                                <div><label>스토리 작성</label></div>
                                <div><p>프로젝트의 스토리를 적어주세요</p></div>
                                <div id="editor"></div>
                            </div>
                        </div>
                    </form>
                    <form id="reward_form" style="display: none">
                        <div>
                            <div><label>프로젝트 리워드 구성</label></div>
                            <div><p>프로젝트를 시작하기 위해서 최소 1개 이상의 리워드가 있어야 합니다.</p></div>
                        </div>
                        <div id="reward_form_box">
                            <div>
                                <input type="hidden" id="reward_code">
                            </div>
                            <div>
                                <label>리워드 금액</label>
                                <input class="text_input" type="text" id="amount">
                            </div>
                            <div>
                                <label>리워드 제공 수</label>
                                <input class="text_input" type="text" id="quantity">
                            </div>
                            <div>
                                <label>리워드 제목</label>
                                <input class="text_input" type="text" id="title">
                            </div>
                            <div>
                                <label>리워드 내용</label>
                                <input class="text_input" type="text" id="info">
                            </div>
                            <div>
                                <label>배송비</label>
                                <input class="text_input" type="text" id="delivery">
                            </div>
                            <div>
                                <div id="btn_box1">
                                    <button id="add_reward_btn" type="button">등록</button>
                                    <button id="reset_reward_btn" type="button">초기화</button>
                                </div>
                                <div id="btn_box2" style="display: none">
                                    <button id="reward_modify_submit_btn" type="button">수정</button>
                                    <button id="cancel_btn" type="button">취소</button>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div><label>리워드 보기</label></div>
                            <div><p>등록된 리워드 목록입니다.</p></div>
                        </div>
                        <div class="reward_container">
                            <c:forEach var="reward" items="${funding.reward}">
                                <div data-code="${reward.rewardCode}" class="reward_box">
                                    <div class="amount">${reward.amount}원</div>
                                    <div>
                                        <div>리워드명</div>
                                        <div class="title">${reward.title}</div>
                                    </div>
                                    <div class="info">${reward.info}</div>
                                    <div>
                                        <div>배송비</div>
                                        <div class="delivery">${reward.delivery}원</div>
                                    </div>
                                    <div class="quantity">제한수량 ${reward.quantity}개</div>
                                    <div>
                                        <button type="button" class="reward_btn reward_modify_btn"><img width="15" height="15" src="/resources/img/icon/modify_icon.svg"/> 수정</button>
                                        <button type="button" class="reward_btn reward_delete_btn"><img width="15" height="15" src="/resources/img/icon/delete_icon_red.svg"/> 삭제</button>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </form>
                </div>
                <div>
                    <button id="save_btn" style="margin-right: 10px">저장</button>
                    <button id="next_btn">다음</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        $("#tag_add_btn").on("click", () => {
            let html = '<div class="tag_box">' + $("#tag_select option:checked").text() +
                            '<button type="button" class="tag_delete_btn"><img width="10" src="/resources/img/icon/close_icon_white.svg"></button>' +
                            '<input type="hidden" name="tags" value="' + $("#tag_select").val() + '">' +
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
                success: function (result) { },
                error: function (e) { }
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
    </script>
</body>
</html>
