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
            margin-bottom: 60px;
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
        .profile_menu_box a{
            font-size: 14px;
            color: #888888;
            text-decoration: none;
        }
        .profile_menu_box a:nth-child(2){
            margin-left: 16px;
        }
        .mypage_bottom{
            width: 100%;
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
        }

        .mypage_bottom > div{
            width: 780px;
        }

        .title_box{
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .title_box h1{
            color: #ff7e00;
        }

        .add_project_btn{
            border: 1px solid #888888;
            height: 35px;
            width: 140px;
            background: none;
        }

        .add_project_btn > a{
            color: #888888;
            font-size: 16px;
            font-weight: 400;
        }

        .menu_box{
            margin-top: 20px;
        }

        .menu_box button{
            color: #888888;
            font-size: 16px;
            padding: 8px 16px;
            border: none;
            background: none;
            margin-right: 10px;
        }

        .menu_box button:nth-child(1){
            color: black;
            border-bottom: 2px solid #888888;
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
                <div class="profile_menu_box">
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
            <div class="menu_box">
                <div>
                    <div>
                        <button>펀딩</button>
                        <button>스토어</button>
                    </div>
                </div>
            </div>
            <div class="contents_box">
                <c:forEach var="item" items="${funding}">
                    <div><a href="/myfunkit/funding/${item.fundingCode}">${item.title}</a></div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
