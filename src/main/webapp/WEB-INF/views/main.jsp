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
                        <a href="/"><p class="logo">FunKit</p></a>
                    </div>
                    <div>
                        <button class="add_recipe">레시피 등록</button>
                        <ul class="nav_top_user">
                            <li>
                               <button id="login_btn">로그인</button>
                            </li>
                            <li>
                                <button id="register_btn">회원가입</button>
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
    <div id="modal" class="modal_overlay">
        <div class="modal_window">
            <div>
                <div>
                    <button id="modal_login_btn">로그인</button>
                    <button id="modal_register_btn">회원가입</button>
                </div>
            </div>
            <div>
                <form id="login_form" style="display: none">
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
                <form id="register_form" style="display: none">
                    <input type="hidden" name="checkId">
                    <div>
                        <label>아이디</label>
                        <input type="text" name="id"/>
                        <button type="button" id="check_id_btn">중복검사</button>
                    </div>
                    <div>
                        <label>비밀번호</label>
                        <input type="password" name="passwd"/>
                    </div>
                    <div>
                        <label>비밀번호 확인</label>
                        <input type="password" name="checkPasswd"/>
                    </div>
                    <div>
                        <label>이름</label>
                        <input type="text" name="name"/>
                    </div>
                    <div>
                        <label>닉네임</label>
                        <input type="text" name="nickName"/>
                    </div>
                    <div>
                        <label>전화번호</label>
                        <input type="text" name="phone"/>
                    </div>
                    <div>
                        <label>이메일</label>
                        <input type="text" name="email"/>
                    </div>
                    <div>
                        <label>우편번호</label>
                        <input type="text" name="postCode" readonly/>
                        <button type="button" onclick="findAddress('register_form')">찾기</button>
                    </div>
                    <div>
                        <label>주소</label>
                        <input type="text" name="address" readonly/>
                    </div>
                    <div>
                        <label>상세주소</label>
                        <input type="text" name="detailAddress"/>
                    </div>
                    <div>
                        <button type="button" id="submit_register_btn">회원가입하기</button>
                    </div>
                </form>
            </div>
            <div>
                <button id="modal_close">닫기</button>
            </div>
        </div>
    </div>
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <!-- Daum Postcode Api -->
    <script src="/resources/js/postcode.js"></script>
    <script src="/resources/js/main.js"></script>
</body>
</html>
