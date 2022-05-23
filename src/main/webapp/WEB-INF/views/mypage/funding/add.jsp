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
        *{
            margin: 0px;
            padding: 0px;
        }
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
            height: 30px;
            width: 110px;
            padding:5px;
            border: none;
            background: #ff7e00;
            color: white;
            border-radius: 5px;
            font-size: 14px;
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

        .form_box form p{
            color: #888888;
            font-size: 14px;
            margin-bottom: 4px;
        }

        .form_box form label{
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

        .funding_img_box{
            width: 180px;
            height:120px;
            border: 1px solid #cccccc;
            background-size: cover;
            margin-right: 15px;
            margin-bottom: 15px;
            position: relative;
        }

        #funding_img_wrap{
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
                    <button id="approval_btn">승인 요청하기</button>
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
                                <div><input class="date_input" name="expDate" type="date" value="<fmt:formatDate value="${funding.expDate}" pattern="yyyy-MM-dd"/>"></div>
                            </div>
                            <div>
                                <div><label>대표 이미지</label></div>
                                <div><p>프로젝트의 대표 이미지를 등록해주세요</p></div>
                                <div id="title_img_box" data-uuid="${funding.mainImage.fileName}" style="background-image: url('/upload/${funding.fundingCode}/mainImage/${funding.mainImage.fileName}')">
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
                                <div id="funding_img_wrap">
                                <c:forEach var="image" items="${funding.fundingImage}">
                                    <div data-uuid="${image.fileName}" class="funding_img_box" style="background-image: url('/upload/${funding.fundingCode}/fundingImage/${image.fileName}')">
                                        <input style="display: none"
                                               type="file"
                                               accept="image/jpeg, image/jpg, image/png"
                                               onchange="readURL(this);">
                                        <div class="file_upload_box">
                                            <div style="display: none">
                                                <button class="update_icon" type="button">
                                                    <img width="15" height="15" src="/resources/img/icon/upload-icon.png"/>변경
                                                </button><button class="delete_icon" type="button">
                                                    <img width="15" height="15" src="/resources/img/icon/delete_icon.png"/>삭제
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                    <div class="funding_img_box" style="display: flex;align-items: center;justify-content: center;">
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
                                <div></div>
                            </div>
                        </div>

                        <div id="reward_form" style="display: none">
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

        //미리보기
        function readURL(input){
            if (input.files && input.files[0]) {
                let reader = new FileReader();
                reader.onload = function (e) {
                    $(input).closest('div').css("background-image", "url('" + e.target.result + "')");
                    if($(input).closest('div').attr("id") === "title_img_box"){
                        $(input).attr("name", "mainImage");
                    } else{
                        $(input).attr("name", "fundingImage");
                    }
                };
                reader.readAsDataURL(input.files[0]);
            }else{
                let fileName = $(input).closest('div').data('uuid');

                if($(input).closest('div').attr("id") === "title_img_box"){
                    $(input).closest('div').css("background-image", "url('/upload/${funding.fundingCode}/mainImage/" + fileName + "')");
                } else{
                    $(input).closest('div').css("background-image", "url('/upload/${funding.fundingCode}/fundingImage/" + fileName + "')");
                }
                $(input).removeAttr("name");
            }
        }

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
            deleteImage($(this).closest('.funding_img_box').data("uuid"));
            $(this).closest('.funding_img_box').remove();
        });


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

        function changeForm(name) {
            if (name === "basicForm") {
                $("#menu_title").text("기본정보");
                $("#story_form").css("display", "none");
                $("#basic_form").css("display", "block");
                $("#form_type").data("form", 1);
                $("#side_menu > li:nth-child(1)").css("color", "#ff7e00");
                $("#side_menu > li:nth-child(1)").css("border-left", "3px solid #ff7e00");
                $("#side_menu > li:nth-child(2)").css("color", "black");
                $("#side_menu > li:nth-child(2)").css("border-left", "none");
                $("#side_menu > li:nth-child(3)").css("color", "black");
            } else if (name === "storyForm") {
                $("#menu_title").text("스토리");
                $("#story_form").css("display", "block");
                $("#basic_form").css("display", "none");
                $("#form_type").data("form", 2);
                $("#side_menu > li:nth-child(1)").css("color", "black");
                $("#side_menu > li:nth-child(1)").css("border-left", "none");
                $("#side_menu > li:nth-child(2)").css("color", "#ff7e00");
                $("#side_menu > li:nth-child(2)").css("border-left", "3px solid #ff7e00");
                $("#side_menu > li:nth-child(3)").css("color", "black");
            } else if (name === "rewardForm") {
            }
        }

        let inputCount = 1;
        $("#add_input").on("click", () => {
            let html = '<div class="funding_img_box">' +
                           '<input onchange="readURL(this);" style="display: none" type="file" accept="image/jpeg, image/jpg, image/png">' +
                           '<div class="file_upload_box">' +
                                '<div style="display: none">' +
                                    '<button class="update_icon" type="button">' +
                                        '<img width="15" height="15" src="/resources/img/icon/upload-icon.png"/>변경' +
                                    '</button>' +
                                    '<button class="delete_icon" type="button">' +
                                        '<img width="15" height="15" src="/resources/img/icon/delete_icon.png"/>삭제' +
                                    '</button>' +
                                '</div>' +
                           '</div>' +
                       '</div>';

            if($(".funding_img_box > input").length === 0){
                $("#funding_img_wrap > div:last").before(html);
            }

            if($(".funding_img_box:last").prev().css("background-image") !== "none"){
                $("#funding_img_wrap > div:last").before(html);
            }
        });


        function deleteImage(fileName){
            let html = '<input type="hidden" name="deleteImages" value="' + fileName + '">'
            if($("input[value='" + fileName +"']").length < 1)
                $("#funding_img_wrap").append(html);
        }

    </script>
</body>
</html>
