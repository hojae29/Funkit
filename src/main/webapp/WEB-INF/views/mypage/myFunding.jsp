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
    <link rel="stylesheet" href="/resources/css/mypage/myFunding.css"/>
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
                    <c:forEach var="payInfo" items="${orderList}">
                        <div class="funding_box" data-order-code="${payInfo.orderCode}">
                            <div>
                                <p>${payInfo.type}</p>
                                <p>${payInfo.fundingStatus}</p>
                            </div>
                            <div>
                                <p>${payInfo.title}</p>
                                <p>${payInfo.corporateName}</p>
                            </div>
                            <div class="status_box">
                                <p>${payInfo.orderStatus}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div id="order_modal" class="modal_overlay">
        <div style="position: absolute;">
            <div class="modal_close">
                <button id="order_modal_close">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#FFFFFF">
                        <path d="M0 0h24v24H0V0z" fill="none"/>
                        <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z"/>
                    </svg>
                </button>
            </div>
            <div class="modal_window">
                <div class="modal_content" style="margin:0">
                    <div>
                        <p id="modal_order_type"></p>
                        <p id="modal_funding_status"></p>
                    </div>
                    <div>
                        <p id="modal_title"></p>
                    </div>
                    <div class="modal_info_box">
                        <p>펀딩번호</p>
                        <p id="modal_order_code"></p>
                    </div>
                    <div class="modal_info_box">
                        <p>펀딩날짜</p>
                        <p id="modal_funding_date"></p>
                    </div>
                    <div class="modal_info_box">
                        <p>결제상태</p>
                        <p id="modal_order_status"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/resources/js/mypage/myFunding.js"></script>
</body>
</html>
