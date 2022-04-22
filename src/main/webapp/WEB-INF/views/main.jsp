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

    <style>

        label {
            font-size: 14px;
            margin-bottom: 10px;
        }

        .modal_window input{
            width: 400px;
            height: 30px;

            background-color: #efefef;
            border: none;
            outline:none;
            border-radius: 5px;
            padding: 0px 5px;
            margin: 5px 0px;
        }
        .modal_window input:focus{
            background-color: white;

            outline: 2px solid #ff7e00;
        }

        .modal_window form p {
            font-size: 12px;
            color: red;
        }

        .modal_window > div{
            margin-top:16px;
        }
        .modal_top div:nth-child(1){
            height : 60px;
        }

        .modal_top div:nth-child(2){
            border-bottom: 2px solid #efefef;
        }

        .modal_top div:nth-child(2) button{
            border:none;
            height: 40px;
            background-color: white;
            padding: 0px 8px;
            font-size: 14px;
            margin-right: 16px;
            border-bottom: 2px solid white;
        }
        .modal_top div:nth-child(2) button:hover{
            background-color: #efefef;
        }

        .submit_btn{
            width: 400px;
            height: 30px;
            background-color: #ff7e00;
            color: white;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            margin-bottom: 16px;
        }

        .submit_btn:hover {
            background-color: #e77400;
        }

        .submit_btn:disabled {
            background-color: rgba(0, 0, 0, 0.05);
            color: rgba(0, 0, 0, 0.24);
        }

    </style>
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
                <div>
                    <form id="login_form" style="display: none">
                        <div>
                            <div><label>아이디</label></div>
                            <div><input type="text" name="id" id="login_id"/></div>
                        </div>
                        <div>
                            <div><label>비밀번호</label></div>
                            <div><input type="password" name="passwd"/></div>
                        </div>
                    </form>
                    <form id="register_form" style="display: none">
                        <input type="hidden" name="checkId">
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
                    </form>
                </div>
                <div>
                    <button type="button" class="submit_btn" id="submit_register_form" disabled>회원가입</button>
                    <button type="button" class="submit_btn" id="submit_login_form" disabled>로그인</button>
                </div>
            </div>
        </div>
    </div>
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="/resources/js/main.js"></script>

</body>
</html>
