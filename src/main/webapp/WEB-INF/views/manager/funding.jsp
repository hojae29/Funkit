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
    <link rel="stylesheet" href="/resources/css/manager/manager.css">
</head>
<body>
    <div id="all-content">
        <!--   왼쪽 콘텐츠-->
        <div class="left-content">
            <div class="title_container"><h1>펀키트</h1></div>
            <div>
                <ul id="menu_list_ul">
                    <li><a href="/mgr/funding/">회원관리</a></li>
                    <li><a href="">펀딩 승인 관리</a></li>
                    <li><a href="">공지사항 관리</a></li>
                </ul>
            </div>
        </div>
        <!--    오른쪽 콘텐츠-->
        <div class="right_container">
            <div class="right_header">
                <h1>펀딩 승인</h1>
            </div>
            <div class="content_box">
                <div>
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
                </div>
            </div>
        </div>
    </div>
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
