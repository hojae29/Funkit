<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-05-10
  Time: 오후 1:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <title> 공지사항</title>
    <link rel="stylesheet" href="/resources/css/notice/notice.css">
</head>
<body>
    <jsp:include page="../header.jsp"/>
    <div id="notice_box">
    <form id="board_top_content">
        <h2>공지사항</h2>
        <div class="bsch_box">
            <select name="search">
                <option value="0">글번호</option>
                <option value="1">제목</option>
                <option value="2">작성자</option>
                <option value="3">작성일</option>
            </select>

            <div class="search">
                <input type="text" name="keyword">
            </div>
            <div id="board_top_button">
                <button>검색</button>
            </div>
        </div>
    </form>
    <div class="boardlist">
        <table class="c_table">
            <thead>
            <tr>
                <th style="width:10%;">글 번호</th>
                <th style="width:60%">제목</th>
                <th style="width:20%;">작성자</th>
                <th style="width:10%;">작성일</th>
            </tr>
            </thead>
            <tbody class="table_b">
            <c:if test="${notice.size() < 1}">
                <tr>
                    <td colspan="5">등록 된 게시물이 없습니다</td>
                </tr>
            </c:if>

            <c:forEach var="notice" items="${list}">
                <tr>
                    <td class="table_b_center">${notice.noticeCode}</td>
                    <td><a href="/notice/${notice.noticeCode}">${notice.title}</a></td>
                    <td class="table_b_center">${notice.id}</td>
                    <td class="table_b_center">
                        <fmt:formatDate value="${notice.regDate}" pattern="YYYY-MM-dd" />
                    </td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot class="foot">
            <tr id="pg-container">
                <td colspan="5">
                    <div id="first-last">
                        <div><a href="?page=1">처음</a></div>
                        <div><a href="?page=${pager.prev}">이전</a></div>

                        <c:forEach var="page" items="${pager.list}">
                            <div><a href="?page=${page}">${page}</a></div>
                        </c:forEach>

                        <div ><a href="?page=${pager.next}">다음</a></div>
                        <div><a href="?page=${pager.last}">마지막</a></div>
                    </div>
                </td>
            </tr>
            </tfoot>
        </table>
    </div>
    <button id="add"><a href="/notice/add">글쓰기</a></button>
    </div>

    <jsp:include page="../footer.jsp"/>
</body>
</html>
