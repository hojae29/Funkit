<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-05-30
  Time: 오전 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>펀키트</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="/resources/css/funding/view.css"/>
</head>
<body>
    <jsp:include page="../header.jsp"/>

    <div class="view_container">
        <div class="left_box">
            <div class="title_box">
                <h1>${funding.title}</h1>
            </div>
            <div class="tag_box">
                <img style="margin-right: 5px;" src="/resources/img/icon/tag_icon.svg"/>
                <p class="tag_text">
                    <c:forEach var="tag" items="${funding.tags}">
                        ${tag.name}
                    </c:forEach>
                </p>
            </div>
            <div class="swiper">
                <!-- Additional required wrapper -->
                <div class="swiper-wrapper">
                    <c:forEach var="image" items="${funding.infoImage}">
                        <div class="swiper-slide"><img class="info_img" src="${image.location}${image.name}"/></div>
                    </c:forEach>
                </div>
                <!-- If we need pagination -->
                <div class="swiper-pagination"></div>

                <!-- If we need navigation buttons -->
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
        <div class="right_box">
            <div>
                <p style="font-size: 16px;font-weight: 600;color: #ff7e00;">이 펀딩의 레시피가 궁금하신가요?</p>
                <p style="font-size: 14px;">레시피 바로가기</p>
            </div>
            <div>
                <p class="info_label">달성률</p>
                <h1 class="funding_percentage">${funding.percentage}%</h1>
            </div>
            <div>
                <p class="info_label">누적 금액</p>
                <h2><fmt:formatNumber value="${funding.cmlAmount}" pattern="#,###"/>원</h2>
            </div>
            <div>
                <p class="info_label">남은기간</p>
                <div style="display: flex; align-items: flex-end;">
                    <h2>D-${funding.DDay}</h2>
                    <P class="end_date_text"><fmt:formatDate value="${funding.expDate}" pattern="yyyy.MM.dd"/> 종료</P>
                </div>
            </div>
            <div>
                <h2>${userCount}명이 펀딩중</h2>
            </div>
            <div>
                <a href="/funding/${funding.fundingCode}/order"><button type="button" id="funding_btn">펀딩하기</button></a>
            </div>
            <div>
                <p class="maker_info_text">메이커 정보</p>
                <div class="maker_box">
                    <div class="company_profile_img"></div>
                    <div>
                        <p class="company_name">${company.corporateName}</p>
                        <p class="company_info">${company.info}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="menu_container">
        <div>스토리</div>
        <div>새 소식</div>
        <div>댓글</div>
    </div>
    <div class="story_container">
        <div>
            ${funding.story}
        </div>
    </div>
    <div id="top_btn">
        TOP
    </div>

    <jsp:include page="../footer.jsp"/>
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script src="/resources/js/funding/view.js"></script>
</body>
</html>
