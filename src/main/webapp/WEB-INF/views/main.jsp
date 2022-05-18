<%--
  Created by IntelliJ IDEA.
  User: hojae
  Date: 2022/04/14
  Time: 9:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Funkit</title>
    <style>
        .con_title{
            display:flex;
            font-size:26px;
            font-weight:bold;
            height:60px;
            align-items: center;
        }
        .color_tit{
            color:#ff7e00;
        }
    </style>
</head>
<body>
    <div>
        <jsp:include page="header.jsp"/>
        <div class="main_con">
            <div id="rank_banner">
                <div id="slideShow">
                    <ul class="slides img-box">
                        <li>
                            <img class="slide1" src="/resources/img/food_main_banner_1.png" alt="">
                        </li>
                        <li>
                            <img class="slide1" src="/resources/img/food_main_banner_2.png" alt="">
                        </li>
                    </ul>
                    <p class="controller">
                        <span class="prev">&lang;</span>
                        <span class="next">&rang;</span>
                    </p>
                </div>
                <div class="recipe_rank">
                    <!-- 레시피 랭킹 -->
                </div>
            </div>
            <div class="now_info">
                <div class="con_title">
                    <p class="color_tit">지금</p>
                    &nbsp;
                    <p>진행중인 펀딩</p>
                </div>
                <div class="now_dis">
                    <div class="now_funding_pic">
                        <img src="/resources/img/now_funding_pic.png">
                    </div>
                    <div class="now_contents">
                        <!-- 진행중인 펀딩 -->
                    </div>
                </div>
            </div>
            <div>
                <div class="">
                    <div class="con_title">
                        <p class="color_tit">사용자</p>
                        &nbsp;
                        <p>님을 위한 레시피 추천</p>
                    </div>
                    <div id="recipe_tag">
                        <ul>
                            <li>#퓨전</li>
                            <li>#야식</li>
                            <li>#얼큰</li>
                        </ul>
                    </div>
                    <div id="recommend_info">
                        <div id="recommend_con">
                            <div class="recommend_sty">
                                <div class="recommend_img">
                                    <!-- 이미지 -->
                                </div>
                                <div>
                                    <div>
                                        <div>
                                            <p class="recommend_title">이태리 짬뽕 파스타</p>
                                        </div>
                                        <div>
                                            <p class="recommend_view">조회수 1000회</p>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="recommend_good">

                                    </div>
                                </div>
                            </div>
                            <div class="recommend_sty">
                                <div class="recommend_img">
                                    <!-- 이미지 -->
                                </div>
                                <div>
                                    <div>
                                        <div>
                                            <p class="recommend_title">이태리 짬뽕 파스타</p>
                                        </div>
                                        <div>
                                            <p class="recommend_view">조회수 1000회</p>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="recommend_good">

                                    </div>
                                </div>
                            </div>
                            <div class="recommend_sty">
                                <div class="recommend_img">
                                    <!-- 이미지 -->
                                </div>
                                <div>
                                    <div>
                                        <div>
                                            <p class="recommend_title">이태리 짬뽕 파스타</p>
                                        </div>
                                        <div>
                                            <p class="recommend_view">조회수 1000회</p>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="recommend_good">

                                    </div>
                                </div>
                            </div>
                            <div class="recommend_sty">
                                <div class="recommend_img">
                                    <!-- 이미지 -->
                                </div>
                                <div>
                                    <div>
                                        <div>
                                            <p class="recommend_title">이태리 짬뽕 파스타</p>
                                        </div>
                                        <div>
                                            <p class="recommend_view">조회수 1000회</p>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="recommend_good">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <link rel="stylesheet" href="/resources/css/now_funding.css" />
    <link rel="stylesheet" href="/resources/css/rank_banner.css" />
    <link rel="stylesheet" href="/resources/css/recommend.css" />
    <link rel="stylesheet" href="/resources/css/slide.css"/>
    <script src="/resources/js/slide.js"/>
</body>
</html>
