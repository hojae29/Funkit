<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-05-10
  Time: 오후 1:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h3>게시판 작성</h3>
  <form method="post">
      <div>
          <label>제목</label>
          <input type="text" name="title">
      </div>
      <div>
          <label>내용</label>
          <textarea name="content"></textarea>
      </div>

      <div>
          <button>등록</button>
          <button>취소</button>
  </form>
</body>
</html>
