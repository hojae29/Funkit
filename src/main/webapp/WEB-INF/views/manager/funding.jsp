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
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
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
                <td class="funding_code">${item.fundingCode}</td>
                <td>${item.title}</td>
                <td>${item.id}</td>
                <td>
                    <button id="approval_btn">승인</button>
                    <button>거절</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <script>
        $("#approval_btn").on("click", function(){
            let code = $(this).closest("td").siblings('.funding_code').text();

            $.ajax({
                url: window.location.pathname + "/" + code,
                method: "PATCH",
                success: result => window.location.reload(),
                error: error => console.log(error)
            });
        });
    </script>
</body>
</html>
