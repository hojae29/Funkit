<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-04-25
  Time: 오후 5:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>레시피 등록하기</title>

    <link rel="stylesheet" href="/resources/css/header.css"/>
    <link rel="stylesheet" href="/resources/css/recipe_add.css">
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
                            <li><a href="">레시피</a></li>
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
    <div>
        <h1>레시피 등록</h1>
        <form method="post">
            <div>
                <label>레시피 제목</label>
                <input type="text" name="title" id="title">
            </div>
            <div>
                <label>레시피 소개</label>
                <input type="text" name="intro" id="intro">
            </div>
            <div>
                <label>카테고리</label>
                <select name="category">
                    <option selected="selected">카테고리 선택</option>
                </select>
            </div>
            <div>
                <label>재료</label>
                <input type="text" name="ingredients" id="ingredients">
            </div>
            <div>
                <label>소요시간</label>
                <input type="number" name="takes" id="takes" min="0">
                <select name="takes_time">
                    <option selected="selected">분</option>
                    <option>시간</option>
                </select>
            </div>
            <div>
                <h3>조리과정</h3>
            </div>
            <div>
                <labe>1</labe>
                <input type="button" class="img_button">
                <input type="text" placeholder="조리 과정을 입력해주세요.">
            </div>
            <div>
                <button>등록하기</button>
                <button>취소</button>
            </div>
        </form>
    </div>
</body>
</html>
