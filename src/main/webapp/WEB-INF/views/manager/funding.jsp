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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <div id="all-content">
        <!--   왼쪽 콘텐츠-->
        <div class="left-content">
            <div class="title_container"><h1>펀키트</h1></div>
            <div>
                <ul id="menu_list_ul">
                    <li><a href="">회원관리</a></li>
                    <li><a href="/mgr/funding/approval">펀딩 승인관리</a></li>
                    <li><a href="/mgr/funding/payment">펀딩 결제관리</a></li>
                    <li><a href="">공지사항 관리</a></li>
                </ul>
            </div>
        </div>
        <!--    오른쪽 콘텐츠-->
        <div class="right_container">
            <div class="right_header">
            </div>
            <div class="content_box">
                <div>
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col" style="width: 10%;">코드</th>
                            <th scope="col" style="width: 60%;">제목</th>
                            <th scope="col" style="width: 15%;">상호명</th>
                            <th scope="col" style="width: 15%;">관리</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${list}">
                            <tr>
                                <th scope="row" class="funding_code">${item.fundingCode}</th>
                                <td>${item.title}</td>
                                <td>${item.id}</td>
                                <td>
                                    <button id="approval_btn" class="btn btn-sm btn-primary">승인</button>
                                    <button class="btn btn-sm btn-danger">거절</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script>
        $("#approval_btn").on("click", function(){
            let code = $(this).closest("td").siblings('.funding_code').text();

            $.ajax({
                url: "/mgr/funding/" + code + "/approval",
                method: "PATCH",
                success: result => window.location.reload(),
                error: error => console.log("승인실패")
            });
        });
    </script>
</body>
</html>
