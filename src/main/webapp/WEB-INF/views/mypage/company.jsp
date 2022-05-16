<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-04-29
  Time: 오후 1:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        .mypage_top{
            width: 100%;
            height: 230px;
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
        .mypage_top_content_box{
            width: 780px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .profile_img_box{
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: skyblue;
            margin-right: 16px;
        }
        .profile_box{
            display: flex;
            align-content: center;
            align-items: center;
        }
        .menu_box a{
            font-size: 14px;
            color: #888888;
            text-decoration: none;
        }
        .menu_box a:nth-child(2){
            margin-left: 16px;
        }
        .mypage_bottom{
            width: 100%;
            display: flex;
            justify-content: center;

        }
        .title_box{
            width: 780px;
            display: flex;
            justify-content: space-between;
        }

        .add_project_btn{
            border: 1px solid #ff7e00;
            height: 30px;
            background: none;
            padding: 5px;
            border-radius: 5px;
        }
        .add_project_btn > a{
            color: #ff7e00;
            font-size: 14px;
        }

    </style>
</head>
<body>
    <jsp:include page="../header.jsp"/>
    <div class="container">
        <div class="mypage_top">
            <div class="mypage_top_content_box">
                <div class="profile_box">
                    <div class="profile_img_box"></div>
                    <div>
                        <h1>${member.corporateName}님</h1>
                        <p>기업회원</p>
                    </div>
                </div>
                <div class="menu_box">
                    <a href="">회원정보 수정</a>
                </div>
            </div>
        </div>
        <div class="mypage_bottom">
            <div class="title_box">
                <div><h1>프로젝트 관리</h1></div>
                <div>
                    <button class="add_project_btn"><a href="funding/make">프로젝트 개설하기</a></button>
                </div>
            </div>
            <div>
            </div>
        </div>
    </div>
</body>
</html>
