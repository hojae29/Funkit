<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-05-09
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/header.css"/>
</head>
<body>
    <div>
        <nav>
            <div class="nav">
                <div class="nav_top">
                    <div class="nav_left">
                        <a href="/"><p class="logo">FunKit</p></a>
                    </div>
                    <div>
                        <button class="add_recipe">레시피 등록</button>
                        <ul class="nav_top_user">
                            <c:if test="${sessionScope.member == null}">
                                <li><button id="login_btn">로그인</button></li>
                                <li><button id="register_btn">회원가입</button></li>
                            </c:if>
                            <c:if test="${sessionScope.member != null}">
                                <li><a href="/myfunkit">${member.id}님</a></li>
                                <li><a href="/logout">로그아웃</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <div class="nav_bottom">
                    <div class="nav_contents">
                        <ul>
                            <li>홈</li>
                            <li>레시피</li>
                            <li><a href="/funding/">펀딩</a></li>
                            <li>랭킹</li>
                            <li>스토어</li>
                            <li>더보기</li>
                        </ul>
                    </div>
                    <div class="nav_search">
                        <input type="text" placeholder="검색하기">
                    </div>
                </div>
            </div>
        </nav>
    </div>
</body>
</html>
