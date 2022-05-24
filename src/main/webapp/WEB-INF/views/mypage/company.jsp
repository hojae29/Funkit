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
    <link rel="stylesheet" href="/resources/css/company.css"/>
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
            <div class="mypage_bottom_container">
                <div class="title_box">
                    <div><h1>프로젝트 관리</h1></div>
                    <div>
                        <button class="add_project_btn"><a href=/myfunkit/company/funding/make>프로젝트 개설하기</a></button>
                    </div>
                </div>
                <div class="menu_box" id="menu_box" data-menu="funding">
                    <div>
                        <div>
                            <button>펀딩</button>
                            <button>스토어</button>
                        </div>
                    </div>
                </div>
                <div class="contents_box">
                    <c:forEach var="item" items="${funding}">
                        <div class="funding_box">
                            <div class="status_text">${item.statusCode}</div>
                            <div class="img_box" style="background-image: url('/upload/${item.fundingCode}/mainImage/${item.mainImage.fileName}')"></div>
                            <div>
                                <p class="funding_title">${item.title == null ? "제작중인 프로젝트" : item.title}</p></div>
                            <div class="button_box">
                                <button><a href="/myfunkit/company/funding/${item.fundingCode}">수정</a></button>
                                <button data-code="${item.fundingCode}" id="delete_funding_btn">삭제</button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div>
                    <tr>
                        <td colspan="7">
                            <div id="pagination" data-page="1">
                                <div><button onclick="movePage(1)"><<</button></div>
                                <div><button onclick="movePage(${pager.prev});"><</button></div>

                                <c:forEach var="page" items="${pager.list}">
                                    <div>
                                        <button class="${page == pager.page ? 'pagination_active' : ''}" onclick="movePage(${page},this)">${page}</button>
                                    </div>
                                </c:forEach>

                                <div><button onclick="movePage(${pager.next})">></button></div>
                                <div><button onclick="movePage(${pager.last})">>></button></div>
                            </div>
                        </td>
                    </tr>
                </div>
            </div>
        </div>
    </div>
    <script src="/resources/js/mypage/company.js"></script>
</body>
</html>
