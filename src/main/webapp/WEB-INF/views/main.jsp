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
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <title>Funkit</title>
</head>
<body>
    <div>
        <nav>
            <div class="nav">
                <div class="nav_top">
                    <div class="nav_left">
                        <a href="/"><p class="logo">FunKit</p></a>
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
                <div>
                    <button id="modal-login-btn">로그인</button>
                    <button id="modal-register-btn">회원가입</button>
                </div>
            </div>
            <div>
                <form id="login-form" style="display: none">
                    <div>
                        <label>아이디</label>
                        <input type="text"/>
                    </div>
                    <div>
                        <label>비밀번호</label>
                        <input type="password"/>
                    </div>
                    <div>
                        <button type="button">로그인</button>
                    </div>
                </form>
                <form id="register-form" style="display: none">
                    <input type="hidden" id="checkId">
                    <div>
                        <label>아이디</label>
                        <input type="text" id="id"/>
                        <button type="button" id="id-check-btn">중복검사</button>
                    </div>
                    <div>
                        <label>비밀번호</label>
                        <input type="password" id="passwd"/>
                    </div>
                    <div>
                        <label>비밀번호 확인</label>
                        <input type="password" id="checkPasswd"/>
                    </div>
                    <div>
                        <label>닉네임</label>
                        <input type="text" id="nickname"/>
                    </div>
                    <div>
                        <label>전화번호</label>
                        <input type="text" id="phone"/>
                    </div>
                    <div>
                        <label>이메일</label>
                        <input type="text" id="email"/>
                    </div>
                    <div>
                        <label>주소</label>
                        <input type="text" id="address"/>
                    </div>
                    <div>
                        <button id="submit-register-btn">회원가입하기</button>
                    </div>
                </form>
            </div>
            <div>
                <button id="modal-close">닫기</button>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="/resources/js/main.js"></script>
</body>
</html>
