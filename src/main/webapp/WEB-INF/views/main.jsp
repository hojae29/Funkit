<%--
  Created by IntelliJ IDEA.
  User: hojae
  Date: 2022/04/14
  Time: 9:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Funkit</title>
    <link rel="stylesheet" href="/resources/css/main/main.css">
    <link rel="stylesheet" href="/resources/css/main/now_funding.css">
    <link rel="stylesheet" href="/resources/css/main/rank_banner.css">
    <link rel="stylesheet" href="/resources/css/main/recipe.css">
    <link rel="stylesheet" href="/resources/css/main/slide.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');
    </style>
</head>
<body>
</body>
<jsp:include page="header.jsp"/>
<!--        메인 콘텐츠-->
<!--       메인 사진-->
<div id="main_con">
    <div id="rank_banner">
        <div id="slideShow">
            <ul class="slides img-box">
                <li><img class="slide1" src="/resources/img/main/funding/food_main_banner_1.png" alt=""></li>
                <li><img class="slide1" src="/resources/img/main/funding/food_main_banner_2.png" alt=""></li>
            </ul>
            <p class="controller">
                <span class="prev">&lang;</span>
                <span class="next">&rang;</span>
            </p>
        </div>
        <!--                실시간 랭킹-->
        <div id="recipe_rank">
            <div class="rank_head">
                <div class="rank_head_live">
                    <a href="">
                        <h1>실시간 랭킹</h1>
                    </a>
                    <a href="">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                             class="bi bi-chevron-right" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                        </svg>
                    </a>
                </div>
                <div class="rank_head_menu">
                    <p style="margin-right: 10px;"><a href="">레시피</a></p>
                    <p><a href="">펀딩</a></p>
                </div>
            </div>
            <!--                    꼬치-->
            <a href="">
                <div class="time_ranking">
                    <div class="time_ranking_title">
                        <h1>1</h1>
                        <div class="time_ranking_title_text">
                            <p>캠핑꼬치는 이걸로! 정통 일본식 꼬치</p>
                            <div class="time_ranking_title_like">
                                <img src="/resources/img/main/funding/like1.png" width="20px" height="17px">
                                <div style="margin-right: 10px;">
                                    <p><span>1203</span>개</p>
                                </div>
                                <img src="/resources/img/main/funding/like2.png" width="20px" height="17px" class="like2">
                                <div>
                                    <p><span>2300</span>개</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img src="/resources/img/main/funding/꼬치.jpg" width="60px" height="60px"
                         style="margin-bottom: 5px;">
                </div>
            </a>
            <!--                    카스테라-->
            <a href="">
                <div class="time_ranking">
                    <div class="time_ranking_title">
                        <h1>2</h1>
                        <div class="time_ranking_title_text">
                            <p>PT쌤과 파티셰가 만든 식단관리 카스테라</p>
                            <div class="time_ranking_title_like">
                                <img src="/resources/img/main/funding/like1.png" width="20px" height="17px">
                                <div style="margin-right: 10px;">
                                    <p><span>1153</span>개</p>
                                </div>
                                <img src="/resources/img/main/funding/like2.png" width="20px" height="17px" class="like2">
                                <div>
                                    <p><span>2137</span>개</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img src="/resources/img/main/funding/빵.jfif" width="60px" height="60px" style="margin-bottom: 5px;">
                </div>
            </a>
            <!--                    국수-->
            <a href="">
                <div class="time_ranking">
                    <div class="time_ranking_title">
                        <h1>3</h1>
                        <div class="time_ranking_title_text">
                            <p>세상에 없던 10초면 익는 국수 등장!</p>
                            <div class="time_ranking_title_like">
                                <img src="/resources/img/main/funding/like1.png" width="20px" height="17px">
                                <div style="margin-right: 10px;">
                                    <p><span>956</span>개</p>
                                </div>
                                <img src="/resources/img/main/funding/like2.png" width="20px" height="17px" class="like2">
                                <div>
                                    <p><span>1802</span>개</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img src="/resources/img/main/funding/스치면.png" width="60px" height="60px"
                         style="margin-bottom: 10px;">
                </div>
            </a>
            <!--                       수육-->
            <a href="">
                <div class="time_ranking">
                    <div class="time_ranking_title">
                        <h1>4</h1>
                        <div class="time_ranking_title_text">
                            <p>믿을 수 없이 부드러운 수비드 수육!</p>
                            <div class="time_ranking_title_like">
                                <img src="/resources/img/main/funding/like1.png" width="20px" height="17px">
                                <div style="margin-right: 10px;">
                                    <p><span>689</span>개</p>
                                </div>
                                <img src="/resources/img/main/funding/like2.png" width="20px" height="17px">
                                <div>
                                    <p><span>1296</span>개</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img src="/resources/img/main/funding/전골.png" width="60px" height="60px"
                         style="margin-bottom: 10px;">
                </div>
            </a>
            <!--                       떡볶이-->
            <a href="">
                <div class="time_ranking">
                    <div class="time_ranking_title">
                        <h1>5</h1>
                        <div class="time_ranking_title_text">
                            <p>매콤하고 달달한 한지음 떡볶이!</p>
                            <div class="time_ranking_title_like">
                                <img src="/resources/img/main/funding/like1.png" width="20px" height="17px">
                                <div style="margin-right: 10px;">
                                    <p><span>642</span>개</p>
                                </div>
                                <img src="/resources/img/main/funding/like2.png" width="20px" height="17px">
                                <div>
                                    <p><span>1132</span>개</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img src="/resources/img/main/funding/떡볶이.png" width="60px" height="60px"
                         style="margin-bottom: 10px;">
                </div>
            </a>
        </div>
    </div>
    <!--            지금 진행중인 펀딩-->
    <!--           펀딩 왼쪽 콘텐츠-->
    <div id="now_info">
        <a href="">
            <div class="now-info-title">
                <h1><span>지금</span>&nbsp;진행중인 &nbsp;펀딩</h1>
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
                </svg>
            </div>
        </a>
        <!--           펀딩 오른쪽 콘텐츠-->
        <div class="funding">
            <a href="">
                <img src="/resources/img/main/funding/now_funding_pic.png">
            </a>
            <div class="funding-right">
                <h2>캠핑꼬치는 이걸로! 육즙이 다른 정통 일본식 꼬치, 이에쿠시</h2>
                <p>"진짜 꼬치가 무엇인지 보여드리겠습니다" 비교해보세요! <br>이에쿠시는 직접 만들어 [육즙]이 다릅니다."</p>
                <div class="funding-right-day">
                    <p><span>13</span>일 남음</p>
                    <p><span>319%</span>&nbsp;달성</p>
                </div>
                <button id="funding_button"><label>펀딩하기</label></button>

                <div class="funding-right-day-food">
                    <!--                                < 아이콘-->
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fil="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" />
                    </svg>
                    <a href="">
                        <img src="/resources/img/main/funding/곰탕.png">
                    </a>
                    <a href="">
                        <img src="/resources/img/main/funding/베이컨빵.png">
                    </a>
                    <a href="">
                        <img src="/resources/img/main/funding/떡볶이.png">
                    </a>
                    <!--                           >아이콘-->
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
                    </svg>
                </div>
            </div>
        </div>
    </div>
    <!--            사용자님을 위한 레시피 추천-->
    <div>
        <div id="recipe">
            <div class="recipe_title">
                <h1><span>사용자</span> 님을 위한 레시피 추천</h1>
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
                </svg>
            </div>
            <div id="recommend_info">
                <div id="recommend_con">
                    <a href="">
                        <!--                           파스타-->
                        <div class="recommend_sty">
                            <img src="/resources/img/main/funding/파스타.png" class="recommend_img">
                            <div class="recommend_sty">
                                <div class="recommend_title">
                                    <div class="recommend_sty_title">
                                        <h1>이태리 짬뽕 파스타</h1>
                                        <p class="recommend_view">조회수 1220회</p>
                                    </div>
                                    <div class="recommend_sty_good">
                                        <img src="/resources/img/main/funding/thumb_up.png" width="25px" height="25px">
                                        <span>1172</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <!--                           도테야끼-->
                    <a href="">
                        <div class="recommend_sty">
                            <img src="/resources/img/main/funding/도테야끼.png" class="recommend_img">
                            <div class="recommend_sty">
                                <div class="recommend_title">
                                    <div class="recommend_sty_title">
                                        <h1>마법같은 요리 도테야끼</h1>
                                        <p class="recommend_view">조회수 1150회</p>
                                    </div>
                                    <div class="recommend_sty_good">
                                        <img src="/resources/img/main/funding/thumb_up.png" width="25px" height="25px">
                                        <span>1132</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <!--                           스튜-->
                    <a href="">
                        <div class="recommend_sty">
                            <img src="/resources/img/main/funding/스튜.png" class="recommend_img">
                            <div class="recommend_sty">
                                <div class="recommend_title">
                                    <div class="recommend_sty_title">
                                        <h1>유럽의 맛, 비프 스튜</h1>
                                        <p class="recommend_view">조회수 847회</p>
                                    </div>
                                    <div class="recommend_sty_good">
                                        <img src="/resources/img/main/funding/thumb_up.png" width="25px" height="25px">
                                        <span>937</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <!--                           평양냉면-->
                    <a href="">
                        <div class="recommend_sty">
                            <img src="/resources/img/main/funding/평양냉면.png" class="recommend_img">
                            <div class="recommend_sty">
                                <div class="recommend_title">
                                    <div class="recommend_sty_title">
                                        <h1>시원한 평양냉면</h1>
                                        <p class="recommend_view">조회수 764회</p>
                                    </div>
                                    <div class="recommend_sty_good">
                                        <img src="/resources/img/main/funding/thumb_up.png" width="25px" height="25px">
                                        <span>863</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!--            호성-->
    <!--           세상에 없던 크라우드 박스-->
    <div class="croud-box">
        <h1>세상에 없던 크라우드 펀딩 Funkit에서 함께 하세요</h1>
        <h2><a href="">더 알아보기</a></h2>
    </div>
    <!--            스토어 둘러보기  -->
    <div class="store">
        <a href="">
            <div class="store-title">
                <h1><span>스토어</span>&nbsp;둘러보기</h1>
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
                </svg>
            </div>
        </a>
        <!--                  스토어 둘러보기 첫줄-->
        <div class="store-content-1">
            <!--                   떡볶이-->
            <a href="">
                <div class="store-content-dish">
                    <img src="/resources/img/main/store/떡볶이.png">
                    <h1>드디어 인생 떡볶이를 찾았다!
                        미정당 떡볶이</h1>
                    <div class="store-content-dish-bottom">
                        <div class="store-content-dish-review">
                            <p id="review">리뷰 1,024개</p>
                            <p>별점 4.8</p>
                        </div>
                        <h2><span id="store-price">10,600</span>원</h2>
                    </div>
                </div>
            </a>
            <!--                    돼지갈비-->
            <a href="">
                <div class="store-content-dish">
                    <img src="/resources/img/main/store/돼지갈비.png">
                    <h1>깊고
                        부드러운 풍미 매콤크림 돼지갈비!</h1>
                    <div class="store-content-dish-bottom">
                        <div class="store-content-dish-review">
                            <p id="review">리뷰 1,010개</p>
                            <p>별점 4.6</p>
                        </div>
                        <h2><span id="store-price">12,600</span>원</h2>
                    </div>
                </div>
            </a>
            <!--                    카레라이스-->
            <a href="">
                <div class="store-content-dish">
                    <img src="/resources/img/main/store/카레라이스.png">
                    <h1>무엇보다도 카레의 맛을 살렸다! <br>장진우 셰프의 카레라이스!</h1>
                    <div class="store-content-dish-bottom">
                        <div class="store-content-dish-review">
                            <p id="review">리뷰 993개</p>
                            <p>별점 4.4</p>
                        </div>
                        <h2><span id="store-price">9,500</span>원</h2>
                    </div>
                </div>
            </a>
            <!--                    어묵탕-->
            <a href="">
                <div class="store-content-dish">
                    <img src="/resources/img/main/store/어묵탕.png">
                    <h1>처음 맛보는 인생어묵탕! 소 한마리 다
                        들어간 오오야 프리미엄 스지어묵탕</h1>
                    <div class="store-content-dish-bottom">
                        <div class="store-content-dish-review">
                            <p id="review">리뷰 982개</p>
                            <p>별점 4.3</p>
                        </div>
                        <h2><span id="store-price">8,300</span>원</h2>
                    </div>
                </div>
            </a>
        </div>
        <!--                  스토어 둘러보기 두줄-->
        <div class="store-content-2">
            <!--                   만두-->
            <a href="">
                <div class="store-content-dish">
                    <img src="/resources/img/main/store/만두.png">
                    <h1>만두가 이렇게 촉촉해도 되
                        는건가요? 제주 흑돼지만두</h1>
                    <div class="store-content-dish-bottom">
                        <div class="store-content-dish-review">
                            <p id="review">리뷰 976개</p>
                            <p>별점 4.3</p>
                        </div>
                        <h2><span id="store-price">6,900</span>원</h2>
                    </div>
                </div>
            </a>
            <!--                    백합-->
            <a href="">
                <div class="store-content-dish">
                    <img src="/resources/img/main/store/백합.png">
                    <h1>딱 3분! 파티음식 준비 끝! 해
                        감 필요없는 갈릭버터 백합팩</h1>
                    <div class="store-content-dish-bottom">
                        <div class="store-content-dish-review">
                            <p id="review">리뷰 972개</p>
                            <p>별점 4.2</p>
                        </div>
                        <h2><span id="store-price">5,500</span>원</h2>
                    </div>
                </div>
            </a>
            <!--                    삼계탕-->
            <a href="">
                <div class="store-content-dish">
                    <img src="/resources/img/main/store/삼계탕.png">
                    <h1>힘내세요~ 울끈불끈 겨울 최고의 보양
                        식, 아버지 삼계탕</h1>
                    <div class="store-content-dish-bottom">
                        <div class="store-content-dish-review">
                            <p id="review">리뷰 964개</p>
                            <p>별점 4.1</p>
                        </div>
                        <h2><span id="store-price">8,900</span>원</h2>
                    </div>
                </div>
            </a>
            <!--                    쭈꾸미-->
            <a href="">
                <div class="store-content-dish">
                    <img src="/resources/img/main/store/쭈꾸미.png">
                    <h1>성수동맛집 '열혈쭈꾸미'
                        의맛 그대로 1팩에 3인분 </h1>
                    <div class="store-content-dish-bottom">
                        <div class="store-content-dish-review">
                            <p id="review">리뷰 957개</p>
                            <p>별점 4.1</p>
                        </div>
                        <h2><span id="store-price">9,500</span>원</h2>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <!--            FUNKIT 새소식-->

    <div class="news">
        <a href="">
            <div class="news-title">
                <h1><span>FUNKIT</span>&nbsp;새소식</h1>
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
                </svg>
            </div>
        </a>
        <!--                FUNKIT 새소식 콘텐츠-->
        <!--               <div class="new-total">-->
        <div class="news-content">
            <!--                   장 칼국수-->
            <a href="">
                <div class="news-content-1">
                    <img src="/resources/img/main/news/장칼국수.png">
                    <div class="news-content-1-title">
                        <h1>공지</h1>
                        <h2>장 칼국수 펀딩 조기 종료 안내</h2>
                        <div class="news-content-title-days">
                            <p>2022.06.15</p>
                        </div>
                    </div>
                </div>
            </a>
            <!--                    부대찌개-->
            <a href="">
                <div class="news-content-1">
                    <img src="/resources/img/main/news/부대찌개.png">
                    <div class="news-content-1-title">
                        <h1>공지</h1>
                        <h2>부대찌개 밀키트 이벤트 종료 안내</h2>
                        <p>2022.06.14</p>
                    </div>
                </div>
            </a>
            <!--                    칠리 새우-->
            <a href="">
                <div class="news-content-1">
                    <img src="/resources/img/main/news/칠리새우.png">
                    <div class="news-content-1-title">
                        <h1>공지</h1>
                        <h2>칠리새우 펀딩 조기 종료 안내</h2>
                        <p>2022.06.14</p>
                    </div>
                </div>
            </a>
        </div>
        <!--                FUNKIT 새소식 콘텐츠 두번째 줄-->
        <div class="news-content2">
            <!--                   오삼불고기-->
            <a href="">
                <div class="news-content-1">
                    <img src="/resources/img/main/news/오삼불고기.png">
                    <div class="news-content-1-title">
                        <h1>공지</h1>
                        <h2>오삼 불고기 펀딩 조기 종료 안내</h2>
                        <p>2022.06.13</p>
                    </div>
                </div>
            </a>
            <!--                    차돌우동-->
            <a href="">
                <div class="news-content-1">
                    <img src="/resources/img/main/news/차돌우동.png">
                    <div class="news-content-1-title">
                        <h1>공지</h1>
                        <h2>차돌우동 밀키트 이벤트 종료 안내</h2>
                        <p>2022.06.11</p>
                    </div>
                </div>
            </a>
            <!--                    곰탕-->
            <a href="">
                <div class="news-content-1">
                    <img src="/resources/img/main/news/곰탕.png">
                    <div class="news-content-1-title">
                        <h1>공지</h1>
                        <h2>곰탕 밀키트 이벤트 종료 안내</h2>
                        <p>2022.06.10</p>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <script src="/resources/js/slide.js"></script>
    <jsp:include page="footer.jsp"/>
</div>
</html>
