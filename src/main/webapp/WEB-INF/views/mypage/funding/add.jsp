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
            width: 780px;
        }

        .form_box form p{
            color: #888888;
            font-size: 14px;
        }

        .form_box form label{
            font-size: 18px;
        }

        #menu_title{
            color: #ff7e00;
            font-size: 26px;
            font-weight: bold;
            margin-top: 50px;
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

        #basic_info_form > div{
            margin-bottom: 20px;
        }
        .form_box form > div{
            margin-bottom:20px;
        }

        #title_img_input{
            width: 350px;
            height:210px;
            border: 1px solid #cccccc;
        }

        #story_img_input{
            width: 170px;
            height: 100px;
            border: 1px solid #cccccc;
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
            margin-bottom: 15px;
        }
        #side_menu > li:nth-child(1) {
            margin-top: 96px;
        }
    </style>
</head>
<body>
    <jsp:include page="../../header.jsp"/>
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
                    <form id="basic_form" method="post" enctype="multipart/form-data">
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
                            <div><input type="file" name="mainImage" id="title_img_input" accept="image/jpeg, image/jpg, image/png"></div>
                        </div>
                    </form>
                    <form id="story_form" method="post" enctype="multipart/form-data" style="display:none">
                        <div>
                            <div><label>이미지 등록</label></div>
                            <div><p>프로젝트의 이미지를 등록해주세요</p></div>
                            <div>
                                <c:forEach var="image" items="${funding.fundingImage}">
                                    <p>${image.fileName}
                                        <button type="button" onclick="deleteImage('${image.fileName}')">삭제</button>
                                    </p>
                                </c:forEach>
                            </div>
                            <div id="funding_image_input_box">
                                <input type="file" accept="image/jpeg, image/jpg, image/png" name="fundingImage">
                            </div>
                        </div>
                        <div>
                            <button type="button" id="add_input">추가</button>
                        </div>
                        <div>
                            <div><label>간단 소개글</label></div>
                            <div><p>간단한 소개글을 적어주세요</p></div>
                            <div><input type="text" class="text_input" name="introduction"></div>
                        </div>
                        <div>
                            <div><label>스토리 작성</label></div>
                            <div><p>프로젝트의 스토리를 적어주세요</p></div>
                            <div></div>
                        </div>
                    </form>
                    <form id="reward_form" style="display:none;">
                        
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
        let deleteImgList = [];

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
            let formType = $("#form_type").data("form");
            let formData;
            if(formType === 1) //기본정보 폼
                formData = new FormData($("#basic_form")[0]);
            else if(formType === 2){
                formData = new FormData($("#story_form")[0]);
                if(deleteImgList.length >= 1)
                {
                    for(const item of deleteImgList){
                        console.dir(item);
                        formData.append("deleteImages", item);
                    }
                }
            } //스토리 폼
            else if(formType === 3){} //리워드 폼

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
                $("#side_menu > li:nth-child(2)").css("color", "black");
                $("#side_menu > li:nth-child(3)").css("color", "black");
            } else if (name === "storyForm") {
                $("#menu_title").text("스토리");
                $("#story_form").css("display", "block");
                $("#basic_form").css("display", "none");
                $("#form_type").data("form", 2);
                $("#side_menu > li:nth-child(1)").css("color", "black");
                $("#side_menu > li:nth-child(2)").css("color", "#ff7e00");
                $("#side_menu > li:nth-child(3)").css("color", "black");
            } else if (name === "rewardForm") {

            }
        }

        $("#add_input").on("click", () => {
            let html = '<input type="file" accept="image/jpeg, image/jpg, image/png" name="fundingImage">'
            $("#funding_image_input_box").append(html);
        });


        function deleteImage(uuid){
            deleteImgList.push(uuid);
            console.log(deleteImgList);
        }

    </script>
</body>
</html>
