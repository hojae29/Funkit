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
    <link rel="stylesheet" href="/resources/css/notice/add.css">
</head>
<body>
<jsp:include page="../header.jsp"/>
<div id="notice-write">
    <h3>게시판 작성</h3>
    <form method="post" class="writer-form">
        <div id="writer-position">
            <div class="writer-form-title">
                <label>제목</label>
                <input type="text" name="title">
            </div>
            <div class="writer-form-content">
                <label>내용</label>
                <textarea name="content"></textarea>
            </div>

            <div id="writer-form-button">
                <button>등록</button>
                <button>취소</button>
            </div>
        </div>
    </form>
</div>
    <jsp:include page="../footer.jsp"/>
</form>
</body>
</html>
