<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-05-26
  Time: 오후 1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>펀키트</title>
    <link rel="stylesheet" href="/resources/css/funding/funding.css"/>
</head>
<body>
    <jsp:include page="../header.jsp"/>
    <div>
        <div class="title_img_box">

        </div>
        <div class="planning_container">
            <div><p class="sub_title">이번 주 기획전</p></div>
            <div class="card_box_container">
                <div class="card_box"></div>
                <div class="card_box"></div>
                <div class="card_box"></div>
                <div class="card_box"></div>
                <div class="card_box"></div>
                <div class="card_box"></div>
            </div>
        </div>
        <div class="tag_container">
            <div class="tag_sub_container">
                <div><p class="sub_title">태그별로 보기</p></div>
                <div>
                    <div class="search_box">
                        <input id="search_input" type="text" placeholder="검색하기">
                    </div>
                </div>
            </div>
        </div>
        <div class="funding_container">
            <div class="funding_item">
                <div class="funding_img_box"></div>
                <div><p class="funding_title">제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 </p></div>
                <div>
                    <p class="tag_text">한식 찜</p>
                </div>
                <div class="funding_percentage">
                    <p>361%</p>
                </div>
                <div class="amount_container">
                    <p>D-15</p>
                    <p>6,960,300원</p>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp"/>
</body>
</html>
