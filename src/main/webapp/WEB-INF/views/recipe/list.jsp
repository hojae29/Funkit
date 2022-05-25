<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-04-25
  Time: 오후 4:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>FunKit Recipe</title>
    <link rel="stylesheet" href="/resources/css/recipe/recipe.css"/>
    <link rel="stylesheet" href="/resources/css/header.css"/>
</head>
<body>
    <div>
        <jsp:include page="../header.jsp"/>
        <div id="recipe_area">
            <div id="recipe_banner">
                <img src="/resources/img/recipe/recipe_banner.png">
            </div>
            <div id="title_area">
                <p>레시피</p>
                &nbsp;
                <p id="recipe_tit">태그</p>
            </div>
            <div>
                <div>
                    <ul id="tag_area">
                        <li>
                            <a>전체</a>
                        </li>
                        <li>
                            <a>한식</a>
                        </li>
                        <li>
                            <a>중식</a>
                        </li>
                        <li>
                            <a>양식</a>
                        </li>
                        <li>
                            <a>디저트</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="grid_area">
                <div id="grid_contents">
                    <div class="card_area" onclick="location.href='http://localhost:8181/recipe/view'">
                        <div>
                            <a>
                                <div class="preview_area">
                                    <img src="/resources/img/recipe/test.jpeg">
                                </div>
                            </a>
                        </div>
                        <div>
                            <div class="card_text">
                                <div class="card_tit_area" >
                                    <p class="card_tit">매콤 달콤 바삭! 맛있는 칠리 새우</p>
                                    <img src="/resources/img/recipe/good.PNG">
                                </div>
                                <div class="card_sub">
                                    <div class="card_tag">
                                        <p>#중식</p>
                                        <p>#튀김</p>
                                    </div>
                                    <div>
                                        <div class="view_area">
                                            <p>조회수</p>
                                            &nbsp;
                                            <p>100</p>
                                        </div>
                                        <div class="like_area">
                                            <img src="/resources/img/recipe/like.PNG">
                                            &nbsp;
                                            <p>546</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card_area"onclick="location.href='http://localhost:8181/recipe/view'">
                        <div>
                            <a>
                                <div class="preview_area">
                                    <img src="/resources/img/recipe/test.jpeg">
                                </div>
                            </a>
                        </div>
                        <div>
                            <div class="card_text">
                                <div class="card_tit_area">
                                    <p class="card_tit">매콤 달콤 바삭! 맛있는 칠리 새우</p>
                                    <img src="/resources/img/recipe/good.PNG">
                                </div>
                                <div class="card_sub">
                                    <div class="card_tag">
                                        <p>#중식</p>
                                        <p>#튀김</p>
                                    </div>
                                    <div>
                                        <div class="view_area">
                                            <p>조회수</p>
                                            &nbsp;
                                            <p>100</p>
                                        </div>
                                        <div class="like_area">
                                            <img src="/resources/img/recipe/like.PNG">
                                            &nbsp;
                                            <p>546</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card_area"onclick="location.href='http://localhost:8181/recipe/view'">
                        <div>
                            <a>
                                <div class="preview_area">
                                    <img src="/resources/img/recipe/test.jpeg">
                                </div>
                            </a>
                        </div>
                        <div>
                            <div class="card_text">
                                <div class="card_tit_area">
                                    <p class="card_tit">매콤 달콤 바삭! 맛있는 칠리 새우</p>
                                    <img src="/resources/img/recipe/good.PNG">
                                </div>
                                <div class="card_sub">
                                    <div class="card_tag">
                                        <p>#중식</p>
                                        <p>#튀김</p>
                                    </div>
                                    <div>
                                        <div class="view_area">
                                            <p>조회수</p>
                                            &nbsp;
                                            <p>100</p>
                                        </div>
                                        <div class="like_area">
                                            <img src="/resources/img/recipe/like.PNG">
                                            &nbsp;
                                            <p>546</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
