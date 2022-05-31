<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-05-31
  Time: 오전 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>펀키트</title>
    <link rel="stylesheet" href="/resources/css/funding/order/step1.css">
</head>
<body>
    <jsp:include page="../../header.jsp"/>

    <div class="main_container">
        <div class="step_container">
            <div class="step_box" style="border-bottom: 3px solid #ff7e00">
                <p>STEP 1</p>
                <p>종류 선택</p>
            </div>
            <hr class="step_line">
            <div class="step_box">
                <p>STEP 2</p>
                <p>결제</p>
            </div>
            <hr class="step_line">
            <div class="step_box">
                <p>STEP 3</p>
                <p>결제 확인</p>
            </div>
        </div>
        <div class="type_container">
            <div><h2>투자 종류 선택</h2></div>
            <div class="type_box_wrap">
                <div class="type_box">
                    <div style="width: 90%;">
                        <p class="type_title">지분</p>
                        <p class="type_info">원하는 금액을 투자합니다</p>
                    </div>
                </div>
                <div class="type_box">
                    <div style="width: 90%;">
                        <p class="type_title">리워드</p>
                        <p class="type_info">원하는 리워드를 골라 투자합니다</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="warning_box">
            <div class="warning_title">
                <img src="/resources/img/icon/warning_icon.svg"/>
                <p>투자위험고지</p>
            </div>
            <div>
                <P>㈜펀키트는 중개업(온라인소액투자중개 및 통신판매중개)을 영위하는 플랫폼 제공자로 자금을 모집하는 당사자가 아닙니다. 따라서 투자손실의 위험을 보전하거나 리워드 제공을 보장해 드리지 않으며 이에 대한 법적인 책임을 지지 않습니다.</P>
            </div>
        </div>

        <hr style="margin: 45px 0px;background-color: #cccccc;height: 1px;border: none;">

        <div class="funding_info_container">
            <div><h2>펀딩 정보</h2></div>
            <div class="funding_info_box">
                <div class="funding_img_box"></div>
                <div class="info_box">
                    <div>
                        <div><p class="fudning_title_text">월간 랭킹 3달 연속 1등! 꾸덕촉촉 저세상 텐션, 브라우니 같은 하루 단백바!</p></div>
                        <div><p class="fudning_info_text">소개글입니다 소개글입니다 소개글입니다</p></div>
                    </div>
                    <div>
                        <div><h2 class="funding_percentage">323%</h2></div>
                        <div class="funding_last_info">
                            <p>D-13</p>
                            <P>2,309,000원</P>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <hr style="margin: 60px 0px 25px 0px;background-color: #cccccc;height: 1px;border: none;">

        <div>
            <div><h2>금액 입력</h2></div>
            <div class="input_container">
                <div style="display: flex;align-items: flex-end;">
                    <input class="amount_input" type="text">
                    <p style="font-size: 16px; font-weight: 500;">원을 투자하겠습니다</p>
                </div>
                <button class="next_btn">다음</button>
            </div>
        </div>
    </div>
</body>
</html>
