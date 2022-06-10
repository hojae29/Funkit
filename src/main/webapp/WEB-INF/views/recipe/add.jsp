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
                                <textarea type="text" name="intro" id="intro" class="long_text" placeholder="레시피에 대해 간단한 소개를 적어주세요."></textarea>
                            </div>
                        </div>
                        <div class="align_info">
                            <div class="label_area">
                                <label>태그</label>
                            </div>
                            <div class="sel_area">
                                <div>
                                    <select id="tag_select">
                                        <c:forEach var="tag" items="${tagList}">
                                            <option value="${tag.tagCode}">${tag.name}</option>
                                        </c:forEach>
                                    </select>
                                    <button type="button" id="tag_add_btn">추가</button>
                                    <%--<button type="button" id="modal_btn">태그 선택하기</button>
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
                                    </div>--%>
                                </div>
                                <div id="tag_list_box">
                                    <c:forEach var="tag" items="${recipe.tags}">
                                        <div class="tag_box">${tag.name}
                                            <button type="button" class="tag_delete_btn">
                                                <img width="10" src="/resources/img/icon/close_icon_white.svg">
                                            </button>
                                            <input type="hidden" name="tagCode" value="${tag.tagCode}">
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="align_info">
                            <div class="label_area">
                                <label>재료</label>
                            </div>
                            <div class="align_input">
                                <input type="text" id="iName" class="sm_num" placeholder="재료명">
                                <input type="text" id="quantity" placeholder="개수" min="1" class="quantity">
                                <button type="button" id="plus_ingredients" onclick="add_Ingredients()">재료 추가하기</button>
                            </div>
                        </div>
                        <div class="align_info">
                            <div class="label_area"></div>
                            <div id="ingredients_area">
                                <div id="ingredients_order">
                                </div>
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
                                <div>
                                    <p>분</p>
                                </div>
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
                                        <img id="preview"/>
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
                                        <img src="/resources/img/recipe/default.png" id="order_img_1"/>
                                    </a>
                                </div>
                                <input type="file" class="img_input" id="img_input_1" accept="image/*" name="subImage">
                                <div>
                                    <textarea placeholder="조리 과정을 입력해주세요." class="text_box" name="cookingProcess"></textarea>
                                </div>
                                <input type="hidden" value="1" name="cookingSeq">
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
                                <a href="javascript:history.back();">
                                    <button type="button">취소</button>
                                </a>
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
<link rel="stylesheet" href="/resources/css/recipe/recipe-add.css">
<link rel="stylesheet" href="/resources/css/recipe/cooking-add.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
    var recipeCode = `${recipeCode}`;
    // input 태그에서 enter 시 submit 방지
    document.addEventListener('keydown', function (event) {
        if (event.keyCode === 13) {
            event.preventDefault();
        }
        ;
    }, true);
</script>
<script src="/resources/js/recipe/recipe-tag.js"></script>
<script src="/resources/js/recipe/main-img.js"></script>
<script src="/resources/js/recipe/recipe_ingredients.js"></script>
<script src="/resources/js/recipe/recipe-order.js"></script>
<script src="/resources/js/recipe/multi-img.js"></script>
</body>
</html>
