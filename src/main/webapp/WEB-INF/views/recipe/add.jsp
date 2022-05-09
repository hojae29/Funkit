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
    <link rel="stylesheet" href="/resources/css/recipe/recipe-add.css">
    <link rel="stylesheet" href="/resources/css/recipe/cooking-add.css">
    <script src="/resources/js/recipe/recipe-order.js"></script>
    <script src="/resources/js/recipe/main-img.js"></script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>

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
                        <ul class="nav_top_user">
                            <li>
                                <button class="add_recipe">레시피 등록</button>
                            </li>
                            <li>
                                <a href="">로그인</a>
                            </li>
                            <li>
                                <a href="">회원가입</a>
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
                    <form>
                        <div class="nav_search">
                            <input type="text" placeholder="검색하기">
                        </div>
                    </form>
                </div>
            </div>
        </nav>
        <div id="content_mar">
            <div id="add_box">
                <div>
                    <p id="add_recipe">레시피 등록</p>
                    <form method="post" id="form_area" enctype="multipart/form-data">
                        <div id="recipe_info">
                            <div class="align_info">
                                <div class="label_area">
                                    <label>제목</label>
                                </div>
                                <div class="align_input">
                                    <input type="text" name="title" id="title" class="mid_text">
                                </div>
                            </div>
                            <div class="align_info">
                                <div class="label_area">
                                    <label>소개</label>
                                </div>
                                <div class="align_input">
                                    <textarea type="text" name="intro" id="intro" class="long_text"></textarea>
                                </div>
                            </div>
                            <div class="align_info">
                                <div class="label_area">
                                    <label>카테고리</label>
                                </div>
                                <div class="sel_area">
                                    <div>
                                        <select name="category">
                                            <option selected="selected">선택</option>
                                        </select>
                                    </div>
                                    <div>

                                    </div>
                                </div>
                            </div>
                            <div class="align_info">
                                <div class="label_area">
                                    <label>재료</label>
                                </div>
                                <div class="align_input">
                                    <input type="text" name="ingredients" id="ingredients" class="mid_text">
                                </div>
                            </div>
                            <div class="align_info">
                                <div class="label_area">
                                    <label>소요시간</label>
                                </div>
                                <div>
                                    <input type="number" name="takes" id="takes" min="0" class="sm_num">
                                </div>
                                <div id="sel_lpad">
                                    <select name="takes_time">
                                        <option selected="selected">분</option>
                                        <option>시간</option>
                                    </select>
                                </div>
                            </div>
                            <div>
                                <div class="align_info">
                                    <div class="label_area">
                                        <label>대표<br>이미지</label>
                                    </div>
                                    <div>
                                        <input type="file" accept="image/*" onchange="mainImg(this)"><span id="img_size_info">*미리보기 사이즈는 600 x 400 입니다.</span>
                                        <br>
                                        <div>
                                            <img id="preview" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="show_main" id="show_main"></div>
                        </div>
                        <div>
                            <div>
                                <p id="add_cooking">조리과정</p>
                            </div>
                            <div class="orders_mar">
                                <div id="orderNo_1" class="order_count">
                                    <div class="label_area">
                                        <labe class="cooking_orders">1</labe>
                                    </div>
                                    <div class="img_button">
                                        <label for="img_input_1">이미지 업로드</label>
                                    </div>
                                    <input type="file" class="img_input" id="img_input_1">
                                    <div>
                                        <textarea placeholder="조리 과정을 입력해주세요." class="text_box"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="orders_mar">
                                <div class="button_area">
                                    <a href="javascript:void(0)" class="button_PnM" onclick="add_order();">&#43;</a>
                                    <a href="javascript:void(0)" class="button_PnM" onclick="del_order();">&#45;</a>
                                </div>
                            </div>
                            <div class="orders_mar">
                                <div class="button_area">
                                    <button class="button_">등록</button>
                                    <button>취소</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
