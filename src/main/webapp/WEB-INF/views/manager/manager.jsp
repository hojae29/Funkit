<%--
  Created by IntelliJ IDEA.
  User: gkqth
  Date: 2022-05-07
  Time: 오후 6:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>펀키트</title>
    <link rel="stylesheet" href="/resources/css/manager/manager.css"/>
</head>
<body>
<div id="all-content">
    <!--   왼쪽 콘텐츠-->
    <div class="left-content">
        <div class="title_container"><h1>펀키트</h1></div>
        <div>
            <ul id="menu_list_ul">
                <li><a href="">회원관리</a></li>
                <li><a href="/mgr/funding/approval">펀딩 승인관리</a></li>
                <li><a href="/mgr/funding/payment">펀딩 결제관리</a></li>
                <li><a href="">공지사항 관리</a></li>
            </ul>
        </div>
    </div>
    <!--    오른쪽 콘텐츠-->
    <div class="right_container">
        <div class="right-content">
        </div>
    </div>
</div>
</body>
</html>
