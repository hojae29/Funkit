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
    <title>펀키트</title>
    <style>
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
            flex-direction: column;
            align-items: center;
        }

        .mypage_bottom_container {
            width: 780px;
        }

        .title_box{
            display: flex;
            align-items: center;
        }

        .title_box h1{
            color: #ff7e00;
        }

        .menu_box{
            margin-top: 20px;
            margin-bottom: 20px;
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

        .contents_box{
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .funding_box{
            width: 100%;
            height: 120px;
            border: 1px solid #E2E2E2;
            padding: 20px;
            position: relative;
        }

        .funding_box > div:nth-child(1) > p:nth-child(1){
            width: 80px;
            color: #53A3FF;
        }

        .funding_box > div:nth-child(1) > p{
            font-size: 14px;
            font-weight: 500;
        }

        .funding_box > div:nth-child(1){
            display: flex;
            margin-bottom: 4px;
        }

        .funding_box > div:nth-child(2) > p:nth-child(1){
            font-size: 18px;
        }

        .funding_box > div:nth-child(2) > p:nth-child(2){
            font-size: 14px;
            color: #888888;
        }

        .status_box{
            position: absolute;
            right: 20px;
            top: 40%;
            font-size: 18px;
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
    <div class="mypage_bottom">
        <div class="mypage_bottom_container">
            <div class="title_box">
                <div><h1>내 펀딩</h1></div>
            </div>
            <div class="menu_box" id="menu_box" data-menu="funding">
                <div>
                    <div>
                        <button>최근</button>
                        <button>리워드</button>
                        <button>지분</button>
                    </div>
                </div>
            </div>
            <div class="contents_box">
                <c:forEach var="order" items="${orderList}">
                    <div class="funding_box">
                        <div>
                            <p>${order.type}</p>
                            <p>${order.fundingStatus}</p>
                        </div>
                        <div>
                            <p>${order.title}</p>
                            <p>${order.corporateName}</p>
                        </div>
                        <div class="status_box">
                            <p>${order.orderStatus}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
