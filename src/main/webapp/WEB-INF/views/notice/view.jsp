<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-05-17
  Time: 오후 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div>
        <p><a href="../update">변경</a></p>
        <p><a href="${notice.noticeCode}/delete">삭제</a></p>
    </div>
    <div>
        <a href="../">목록</a>
    </div>
</div>
</body>
</html>
