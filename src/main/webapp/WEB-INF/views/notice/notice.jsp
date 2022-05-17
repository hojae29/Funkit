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
</head>
<body>
    <jsp:include page="../header.jsp"/>
    <form>
        <div>
            <select name="search">
                <option value="0">글번호</option>
                <option value="1">제목</option>
                <option value="2">작성자</option>
                <option value="3">작성일</option>
            </select>
        </div>
        <div>
            <input type="text" name="keyword">
        </div>
        <div>
            <button>검색</button>
        </div>
    </form>
    <div>
        <table border="1">
            <thead>
                <tr>
                    <th>글 번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody>
            <c:if test="${notice.size() < 1}">
                <tr>
                    <td colspan="5">등록 된 게시물이 없습니다</td>
                </tr>
            </c:if>

            <c:forEach var="notice" items="${list}">
                <tr>
                    <td>${notice.noticeCode}</td>
                    <td><a href="view/${notice.noticeCode}">${notice.title}</a></td>
                    <td>${notice.id}</td>
                    <td>
                        <fmt:formatDate value="${notice.regDate}" pattern="YYYY-MM-dd"/>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="5">
                    <div>
                        <div><a href="?page=1">처음</a></div>
                        <div><a href="?page=${pager.prev}">이전</a></div>

                        <c:forEach var="page" items="${pager.list}">
                            <div><a href="?page=${page}">${page}</a></div>
                        </c:forEach>

                        <div><a href="?page=${pager.next}">다음</a></div>
                        <div><a href="?page=${pager.last}">마지막</a></div>
                    </div>
                </td>
            </tr>
            </tfoot>
        </table>
    </div>
    <button><a href="add">글쓰기</a></button>
</body>
</html>
