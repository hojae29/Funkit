<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-06-07
  Time: 오전 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>펀키트</title>
    <link rel="stylesheet" href="/resources/css/mypage/individual.css">
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
                <div class="user_info_container">
                    <a href="/myfunkit/individual/funding">
                        <div class="user_info_text_box">
                            <h1>${orderCount}</h1>
                            <p>펀딩</p>
                        </div>
                    </a>
                    <div class="user_info_border"></div>
                    <div class="user_info_text_box">
                        <h1>0</h1>
                        <p>레시피</p>
                    </div>
                    <div class="user_info_border"></div>
                    <div class="user_info_text_box">
                        <h1>0</h1>
                        <p>구매</p>
                    </div>
                    <div class="user_info_border"></div>
                    <div class="user_info_text_box">
                        <h1>0</h1>
                        <p>찜</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
