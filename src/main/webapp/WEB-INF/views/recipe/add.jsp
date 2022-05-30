<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-04-25
  Time: 오후 5:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>레시피 등록하기</title>
</head>
<body>
    <div>
        <jsp:include page="../header.jsp"/>
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
                                    <label>태그</label>
                                </div>
                                <div class="sel_area">
                                    <div>
                                        <button type="button" id="modal_btn">태그 선택하기</button>
                                        <div class="modal_background"></div>
                                        <div class="modal_wrap">
                                            <div>
                                                <div id="modal_header">
                                                    <div id="modal_tit">
                                                        <p>태그 선택</p>
                                                    </div>
                                                    <div class="tag_close">
                                                        <button id="close_btn" type="button">닫기</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <div id="modal_contents">
                                                    <div id="select_area">
                                                        <input type="text" name="tag" placeholder="태그를 입력해주세요.">
                                                    </div>
                                                    <div id="tag_area">
                                                        <ul id="tag_list">
                                                            <c:forEach var="tag" items="${tag}">
                                                                <li>${tag.name}</li>
                                                            </c:forEach>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div>

                                                </div>
                                            </div>
                                        </div>
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
                                        <input type="file" accept="image/*" onchange="mainPreview(this)" id="img" name="mainImage">
                                        <span id="img_size_info">*미리보기 사이즈는 600 x 400 입니다.</span>
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
                                        <a href="javascript:void(0)" onclick="fileUpload(1)">
                                            <img src="/resources/img/recipe/default.png" id="order_img_1" />
                                        </a>
                                    </div>
                                    <input type="file" class="img_input" id="img_input_1" accept="image/*">
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
                                <div id="sub_btn">
                                    <button>등록</button>
                                    <a href="javascript:history.back();"><button type="button">취소</button></a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </div>
    <link rel="stylesheet" href="/resources/css/header.css"/>
    <link rel="stylesheet" href="/resources/css/recipe/recipe-modal.css">
    <link rel="stylesheet" href="/resources/css/recipe/recipe-add.css">
    <link rel="stylesheet" href="/resources/css/recipe/cooking-add.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        var recipeCode = `${recipeCode}`;
    </script>
    <script src="/resources/js/recipe/recipe-modal.js"></script>
    <script src="/resources/js/recipe/main-img.js"></script>
    <script src="/resources/js/recipe/recipe-order.js"></script>
    <script src="/resources/js/recipe/multi-img.js"></script>
</body>
</html>
