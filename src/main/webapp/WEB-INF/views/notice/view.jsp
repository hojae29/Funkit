<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-05-17
  Time: 오후 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title></title>
</head>
<body>
<div>
    <div>
        <label>제목</label>
        <div>"${notice.title}"</div>
    </div>

    <div>
        <label>내용</label>
        <div>${notice.content}</div>
    </div>
    <c:if test="${sessionScope.member.id == notice.id}">
        <div>
            <p><a href="${notice.noticeCode}/update">변경</a></p>
            <p><a href="${notice.noticeCode}/delete">삭제</a></p>
        </div>
    </c:if>
    <div>
        <a href="../">목록</a>
    </div>
</div>
</body>
</html>
