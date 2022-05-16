<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-05-09
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
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
                        <button class="add_recipe"><a href="/recipe/add" style="color:white">레시피 등록</a></button>
                        <ul class="nav_top_user">
                            <c:if test="${sessionScope.member == null}">
                                <li><button id="login_btn">로그인</button></li>
                                <li><button id="register_btn">회원가입</button></li>
                            </c:if>
                            <c:if test="${sessionScope.member != null}">
                                <li><a href="/myfunkit/">${member.id}님</a></li>
                                <li><a href="/logout">로그아웃</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <div class="nav_bottom">
                    <div class="nav_contents">
                        <ul>
                            <li>홈</li>
                            <li><a href="http://localhost:8181/recipe/">레시피</a></li>
                            <li><a href="/funding/">펀딩</a></li>
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
        <div style="position: absolute;">
            <div class="modal_close">
                <button id="modal_close">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#FFFFFF">
                        <path d="M0 0h24v24H0V0z" fill="none"/>
                        <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z"/>
                    </svg>
                </button>
            </div>
            <div class="modal_window">
                <div class="modal_top" style="margin: 0;">
                    <div>Funkit</div>
                    <div>
                        <button id="modal_login_btn">로그인</button>
                        <button id="modal_register_btn">회원가입</button>
                    </div>
                </div>
                <div id="type_box">
                    <button id="individual_btn" type="button">개인</button>
                    <button id="company_btn" type="button">기업</button>
                </div>
                <div>
                    <form id="login_form" style="display: none">
                        <div>
                            <div><label>아이디</label></div>
                            <div><input type="text" id="login_id" name="id"/></div>
                        </div>
                        <div>
                            <div><label>비밀번호</label></div>
                            <div><input type="password" id="login_passwd"/></div>
                        </div>
                        <div>
                            <p id="login_msg"></p>
                        </div>
                    </form>
                    <form id="register_form" style="display: none">
                        <input type="hidden" id="register_type">
                        <div>
                            <div><label>아이디</label></div>
                            <div><input type="text" name="id" id="register_id"/></div>
                            <div><p id="register_id_msg"></p></div>
                        </div>
                        <div>
                            <div><label>비밀번호</label></div>
                            <div><input type="password" name="passwd" id="register_passwd"/></div>
                            <div><p id="register_passwd_msg"></p></div>
                        </div>
                        <div>
                            <div><label>비밀번호 확인</label></div>
                            <div><input type="password" name="checkPasswd" id="check_passwd"/></div>
                            <div><p id="check_passwd_msg"></p></div>
                        </div>
                        <div>
                            <div><label>이름</label></div>
                            <div><input type="text" name="name" id="name"/></div>
                            <div><p id="name_msg"></p></div>
                        </div>
                        <div>
                            <div><label>이메일</label></div>
                            <div><input type="text" name="email" id="email"/></div>
                            <div><p id="email_msg"></p></div>
                        </div>
                        <div id="company_box">
                            <div>
                                <div><label>전화번호</label></div>
                                <div><input type="text" id="phone"></div>
                                <div><p id="phone_msg"></p></div>
                            </div>
                            <div>
                                <div><label>상호명</label></div>
                                <div><input type="text" id="corporate_name"></div>
                                <div><p id="corporateName_msg"></p></div>
                            </div>
                        </div>
                    </form>
                    <form id="check_email_form" style="display: none">
                        <div>
                            <div><label>인증번호 입력</label></div>
                            <div><input type="text" id="token"></div>
                            <div><p id="token_msg"></p></div>
                        </div>
                    </form>
                </div>
                <div>
                    <button type="button" class="submit_btn" id="submit_register_form" disabled>회원가입</button>
                    <button type="button" class="submit_btn" id="submit_login_form">로그인</button>
                    <button type="button" class="submit_btn" id="check_token_btn">인증하기</button>
                </div>
            </div>
        </div>
    </div>
    <link rel="stylesheet" href="/resources/css/header.css"/>
    <link rel="stylesheet" href="/resources/css/modal.css"/>
    <link rel="stylesheet" href="/resources/css/main.css">
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="/resources/js/header.js"></script>
</body>
</html>
