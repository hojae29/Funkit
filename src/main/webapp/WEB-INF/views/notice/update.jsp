<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-05-16
  Time: 오후 1:54
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
        <h3>게시글 변경</h3>
    </div>
    <form method="post">
        <div>
            <label>제목</label>
            <input type="text" name="title" value="${notice.title}">
        </div>

        <div>
            <label>내용</label>
            <textarea name="content">${notice.content}</textarea>
        </div>

        <div>
            <button>변경</button>
            <button type="button">취소</button>
        </div>
    </form>
</div>
</body>
</html>
