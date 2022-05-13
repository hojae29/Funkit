<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-04-25
  Time: 오후 4:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>FunKit Recipe</title>

    <link rel="stylesheet" href="/resources/css/header.css"/>
</head>
<body>
    <div>
        <jsp:include page="../header.jsp"/>
        <div>
            <c:if test="${list.size() < 1}">
                <div>등록된 레시피가 없습니다</div>
            </c:if>
            <c:forEach items="${list}" var="item">
                <div>${item.title}</div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
