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
                    <h1>${member.name}님</h1>
                    <p>개인회원</p>
                </div>
            </div>
            <div class="menu_box">
                <a href="">회원정보 수정</a>
                <a href="">결제정보 설정</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
