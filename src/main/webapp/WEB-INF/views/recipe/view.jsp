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
        <div id="main_contents">
            <div>
                <div id="title_area">
                    <h1>${recipe.title}</h1>
                </div>
                <div id="tag_area">
                    <img src="/resources/img/icon/tag_icon.svg">
                    <p>
                        <c:forEach var="tag" items="${recipe.tags}">
                            ${tag.name}
                        </c:forEach>
                    </p>
                </div>
                <div id="main_img_area">
                    <img id="main_img" src="${recipe.mainImage.location}${recipe.mainImage.name}"/>
                </div>
            </div>
            <div id="info_area">
                <div>

                </div>

                <div>
                    <p id="recipe_intro_tit">레시피 소개</p>
                    <div id="intro_area">
                        <p>${recipe.intro}</p>
                    </div>
                </div>

                <div>
                    <div id="time_area">
                        <div>
                            <img src="/resources/img/recipe/time.PNG">
                        </div>
                        <div style="margin-left:10px;">
                            <p>소요시간 약 ${recipe.takes} 분</p>
                        </div>
                    </div>
                </div>

                <div class="info_area">
                    <div id="link_area" onclick="link_copy(); return false;">
                        <img src="/resources/img/recipe/link.PNG"/>
                    </div>

                    <div class="viewLike">
                        <div class="sub_img_box">
                            <img src="/resources/img/recipe/love.PNG">
                        </div>
                        <div class="sub_info_area">
                            <p>${recipe.favoriteCnt}</p>
                        </div>
                    </div>

                    <div class="viewLike">
                        <div class="sub_img_box">
                            <img src="/resources/img/recipe/view.PNG">
                        </div>
                        <div class="sub_info_area">
                            <p>${recipe.view}</p>
                        </div>
                    </div>
                </div>

                <div>
                    <button type="button" id="like_btn" onclick="like_btn()">레시피 찜하기</button>
                </div>
                <div>
                    <p class="maker_info_text">메이커 정보</p>
                    <div class="maker_box">
                        <div class="company_profile_img"></div>
                        <div>
                            <p class="company_name">${recipe.id}</p>
                            <p class="company_info"></p>
                        </div>
                    </div>
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
                                <p>${cook.cookingExplain}</p>
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
    <div id="top_btn">
        TOP
    </div>
    <jsp:include page="../footer.jsp"/>
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
                    // type:"GET",
                    data:{
                        code : ${recipe.recipeCode}
                    },
                    dataType:"json",
                    success:function (likeCheck){
                        if(likeCheck == 0) {
                            alert("관심 레시피로 등록하였습니다.");
                            location.reload();
                        }else if (likeCheck==1){
                            alert("관심 레시피를 취소하셨습니다.");
                            location.reload();
                        }
                    }
                })

            }
        }
    </script>
    <script src="/resources/js/recipe/recipe-view.js" />
</div>
</body>
</html>
