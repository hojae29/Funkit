<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-05-25
  Time: 오후 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>레시피 소개</title>
    <link rel="stylesheet" href="/resources/css/recipe/recipe-view.css"/>
</head>
<body>
<div>
    <jsp:include page="../header.jsp"/>
    <div id="all">
        <div>
            <div>
                <div>
                    <p id="recipe_tit">${recipe.title}</p>
                </div>
                <div>
                    <p id="writer_id">${recipe.id}</p>
                </div>
            </div>
            <div id="info_all">
                <div>
                    <div id="main_img" style="background-image: url('${recipe.mainImage.location}${recipe.mainImage.name}')"></div>
                </div>
                <div id="info_area">
                    <div id="recipe_info">
                        <p>레시피 정보</p>
                    </div>
                    <div id="intro">
                        <p>${recipe.intro}</p>
                    </div>
                    <dvi id="position_bottom">
                        <div id="tag_area">
                            <div>
                                <img src="/resources/img/icon/tag_icon.svg">
                            </div>
                            <div>
                                <p>
                                    <c:forEach var="tag" items="${recipe.tags}">
                                        ${tag.name}
                                    </c:forEach>
                                </p>
                            </div>
                        </div>
                        <div id="sub_info">
                            <div id="time_area">
                                <div>
                                    <img src="/resources/img/recipe/time.PNG">
                                </div>
                                <div>

                                </div>
                                <div id="time_txt">
                                    <div>
                                        <p>소요시간</p>
                                    </div>
                                    <div>
                                        <p>약 ${recipe.takes}분</p>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="sub_order">
                                    <div>
                                        <img src="/resources/img/recipe/love.PNG">
                                    </div>
                                    <div>
                                        <p>관심수</p>
                                    </div>
                                    <div>
                                        <p>${recipe.favoriteCnt}</p>
                                    </div>
                                </div>
                                <div class="sub_order">
                                    <div>
                                        <img src="/resources/img/recipe/view.PNG">
                                    </div>
                                    <div>
                                        <p>조회수</p>
                                    </div>
                                    <div>
                                        <p>${recipe.view}</p>
                                    </div>
                                </div>
                                <div class="sub_order" onclick="link_copy(); return false;">
                                    <div>
                                        <img src="/resources/img/recipe/link.PNG">
                                    </div>
                                    <div>
                                        <p>링크 복사하기</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="like_btn" onclick="like_btn()">
                            <p>관심 레시피 등록</p>
                        </div>
                    </dvi>
                </div>
            </div>
        </div>
        <div id="ingredient">
            <div class="sub_tit">
                <p>재료</p>
            </div>
            <div id="ingred_info_area">
                <c:forEach var="ingred" items="${recipe.ingredients}">
                    <div class="ingred_info">
                        <p>${ingred.ingreName}</p>
                        <p>${ingred.ingreQua}</p>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div id="cooking_order">
            <div class="sub_tit">
                <p>조리과정</p>
            </div>
            <div>
                <div id="order_div">
                    <c:forEach var="cook" items="${recipe.cookings}">
                        <div class="order_area">
                            <div class="num_area">
                                <p>${cook.cookingSeq}</p>
                            </div>
                            <div class="order_info_area">
                                <p>${cook.cookingProcess}</p>
                            </div>
                            <div class="order_img_area">
                                <img src="${cook.location}${cook.fileName}">
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp"/>
    <script src="/resources/js/recipe/link-copy.js"></script>
    <script>
        function like_btn(){
            if (${sessionScope.member.id == null}){
                alert("관심 기능은 로그인 후 이용 가능합니다.")
            }
            if(${sessionScope.member.id == recipe.id}){
                alert("본인 글에는 추천이 불가능합니다.")
            }
            if(${sessionScope.member.id != null}){
                $.ajax({
                    url:"/recipe/favoriteAjaxAction",
                    type:"POST",
                    data:{
                        code : ${recipe.recipeCode}
                    },
                    dataType:"json"
                })
            }
        }
    </script>
</div>
</body>
</html>
