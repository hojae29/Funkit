<%--
  Created by IntelliJ IDEA.
  User: hojae
  Date: 2022/04/14
  Time: 9:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/header.css"/>
    <link rel="stylesheet" href="/resources/css/modal.css"/>
    <title>Funkit</title>
</head>
<body>
    <div>
        <nav>
            <div class="nav">
                <div class="nav_top">
                    <div class="nav_left">
                        <p class="logo">FunKit</p>
                    </div>
                    <div>
                        <button class="add_recipe">레시피 등록</button>
                        <ul class="nav_top_user">
                            <li>
                               <button id="login-btn">로그인</button>
                            </li>
                            <li>
                                <button id="register-btn">회원가입</button>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="nav_bottom">
                    <div class="nav_contents">
                        <ul>
                            <li>홈</li>
                            <li>레시피</li>
                            <li>펀딩</li>
                            <li>랭킹</li>
                            <li>스토어</li>
                            <li>더보기</li>
                        </ul>
                    </div>
                    <div class="nav_search">
                        <input type="text" placeholder="검색하기">
                    </div>
                </div>
            </div>
        </nav>
    </div>
    <!-- 로그인/회원가입 modal -->
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div>
                <button id="modal-close">닫기</button>
            </div>
        </div>
    </div>
    <script>
        const modal = document.getElementById("modal");
        document.getElementById("login-btn").addEventListener("click", ev => {
            modal.style.display = "flex";
        });

        document.getElementById("register-btn").addEventListener("click", ev => {
            modal.style.display = "flex";
        });

        document.getElementById("modal-close").addEventListener("click", ev => {
           modal.style.display = "none";
        });
    </script>
</body>
</html>
