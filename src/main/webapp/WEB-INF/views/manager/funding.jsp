<%--
  Created by IntelliJ IDEA.
  User: gkqth
  Date: 2022-05-25
  Time: 오전 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>펀키트</title>
</head>
<body>
    <table>
        <thead>
            <tr>
                <td>코드</td>
                <td>제목</td>
                <td>상호명</td>
                <td>관리</td>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${list}">
            <tr>
                <td>${item.fundingCode}</td>
                <td>${item.title}</td>
                <td>${item.id}</td>
                <td>
                    <button>승인</button>
                    <button>거절</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
