<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-05-26
  Time: 오후 1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>펀키트</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="/resources/css/funding/funding.css"/>
</head>
<body>
    <jsp:include page="../header.jsp"/>
    <div class="main_container">
        <div class="swiper">

            <div class="swiper-wrapper">
                <div class="swiper-slide"><img class="title_img" src="/resources/img/funding/배너1.png"></div>
                <div class="swiper-slide"><img class="title_img" src="/resources/img/funding/배너2.png"></div>
                <div class="swiper-slide"><img class="title_img" src="/resources/img/funding/배너3.png"></div>
                <div class="swiper-slide"><img class="title_img" src="/resources/img/funding/배너4.png"></div>
            </div>

            <div class="swiper_button_wrap">
                <div class="swiper-pagination"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>

        </div>
        <div class="planning_container">
            <div style="margin-bottom: 16px;"><p class="sub_title">이번 주 기획전</p></div>
            <div class="card_box_container">
                <div class="card_box" style="background-image: url('/resources/img/funding_banner/1.png')"></div>
                <div class="card_box" style="background-image: url('/resources/img/funding_banner/2.png')"></div>
                <div class="card_box" style="background-image: url('/resources/img/funding_banner/3.png')"></div>
                <div class="card_box" style="background-image: url('/resources/img/funding_banner/4.png')"></div>
                <div class="card_box" style="background-image: url('/resources/img/funding_banner/5.png')"></div>
                <div class="card_box" style="background-image: url('/resources/img/funding_banner/6.png')"></div>
            </div>
        </div>
        <div class="tag_container">
            <div class="tag_sub_container">
                <div><p class="sub_title">태그별로 보기</p></div>
                <div>
                    <div class="search_box">
                        <select style="border: none; outline: none;">
                            <option value="1">최신순</option>
                            <option value="2">오래된순</option>
                        </select>
                        <input id="search_funding" type="text" name="keyword" placeholder="검색하기">
                    </div>
                </div>
            </div>
            <div class="tag_box_wrap">
                <div class="tag_box tag_box_hover" data-tag-code="0">#전체</div>
                <c:forEach var="tag" items="${tagList}">
                    <div class="tag_box" data-tag-code="${tag.tagCode}">#${tag.name}</div>
                </c:forEach>
            </div>
        </div>
        <div class="funding_container">
            <c:forEach var="item" items="${fundingList}">
                <div class="funding_item">
                    <a href="/funding/${item.fundingCode}"><div class="funding_img_box" style="background-image: url('${item.mainImage.location}${item.mainImage.name}')"></div></a>
                    <div class="funding_title_container">
                        <a class="funding_title" href="/funding/${item.fundingCode}">${item.title}</a>
                    </div>
                    <div style="display: flex;">
                        <img class="tag_icon" src="/resources/img/icon/tag_icon.svg"/>
                        <p class="tag_text"><c:forEach var="tag" items="${item.tags}">${tag.name} </c:forEach></p>
                    </div>
                    <div class="funding_percentage">
                        <p>${item.percentage}%</p>
                    </div>
                    <div class="amount_container">
                        <p>D-${item.DDay}</p>
                        <p><fmt:formatNumber value="${item.cmlAmount}" pattern="#,###"/>원</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <jsp:include page="../footer.jsp"/>
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script src="/resources/js/swiper.js"></script>
    <script>
         $(".tag_box").on("click", function(){
             $(".funding_container > .tag_box").remove();
             $.ajax({
                 url: window.location.pathname + "/filter?tagCode=" + $(this).data("tag-code"),
                 method: "GET",
                 success: result => {
                     let fundingItemHTML = "";

                     result.forEach(item => {
                         let tags = "";
                         item.tags.forEach(item => tags += item.name + " ");

                         let html =  '<div class="funding_item">'+
                                     '    <a href="/funding/' + item.fundingCode + '"><div class="funding_img_box" style="background-image: url(' + item.mainImage.location + item.mainImage.name + ')"></div></a>'+
                                     '    <div class="funding_title_container">'+
                                     '        <a class="funding_title" href="/funding/' + item.fundingCode + '">' + item.title + '</a>'+
                                     '    </div>'+
                                     '    <div style="display: flex;">'+
                                     '        <img class="tag_icon" src="/resources/img/icon/tag_icon.svg"/>'+
                                     '        <p class="tag_text">' + tags + '</p>'+
                                     '    </div>'+
                                     '    <div class="funding_percentage">'+
                                     '        <p>' + item.percentage + '%</p>'+
                                     '    </div>'+
                                     '    <div class="amount_container">'+
                                     '        <p>D-' + item.dday + '</p>'+
                                     '        <p>' + item.cmlAmount + '원</p>'+
                                     '    </div>'+
                                     '</div>';

                         fundingItemHTML += html;
                     });

                     $(".funding_container > .funding_item").remove();
                     $(fundingItemHTML).appendTo(".funding_container").hide().fadeIn(300);
                     tagBoxHover($(this).data("tag-code"));
                 },
                 error: error => console.log(error)
             });
         });

         function tagBoxHover(tagCode){
             $(".tag_box_hover").removeClass("tag_box_hover");
             $(".tag_box[data-tag-code=" + tagCode + "]").addClass("tag_box_hover");
         }
    </script>
</body>
</html>
