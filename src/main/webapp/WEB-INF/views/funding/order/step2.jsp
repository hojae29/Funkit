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
    <link rel="stylesheet" href="/resources/css/funding/order/step2.css">
</head>
<body>
    <jsp:include page="../../header.jsp"/>
    <div class="main_container">
        <div class="step_container">
            <div class="step_box">
                <p>STEP 1</p>
                <p>종류 선택</p>
            </div>
            <hr class="step_line">
            <div class="step_box" style="border-bottom: 3px solid #ff7e00">
                <p>STEP 2</p>
                <p>결제</p>
            </div>
            <hr class="step_line">
            <div class="step_box">
                <p>STEP 3</p>
                <p>결제 확인</p>
            </div>
        </div>

        <div>
            <div><h2>펀딩 정보</h2></div>
            <div><p>월간 랭킹 3달 연속 1등! 꾸덕촉촉 저세상 텐션, 브라우니 같은 하루 단백바!</p></div>
            <div>
                <div class="text_box_wrap">
                    <div class="text_box">
                        <p>투자 형식</p>
                        <p>지분</p>
                    </div>
                    <div class="text_box">
                        <p>펀딩 금액</p>
                        <p>120,000원</p>
                    </div>
                    <div class="text_box">
                        <p>배송비</p>
                        <p>0원</p>
                    </div>
                </div>
                <div class="text_box_wrap2">
                    <div class="text_box">
                        <p>수익 지급일</p>
                        <p>2022.07.14</p>
                    </div>
                    <div class="text_box">
                        <p>수익 분배율</p>
                        <p>30%</p>
                    </div>
                </div>
            </div>
        </div>

        <div>
            <div><h2>결제자 정보</h2></div>
            <div class="text_box_wrap3">
                <div class="text_box">
                    <p>이름</p>
                    <p>홍길동</p>
                </div>
                <div class="text_box">
                    <p>전화번호</p>
                    <p>010-1111-1111</p>
                </div>
                <div class="text_box">
                    <p>이메일</p>
                    <p>gkqthd6386@naver.com</p>
                </div>
            </div>
        </div>

        <div>
            <div><h2>약관 동의</h2></div>
            <div style="margin-top:12px;">
                <div class="check_box_wrap">
                    <div>
                        <label><input type="checkbox" name="color" value="blue">전체 동의 하기</label>
                    </div>
                    <div>
                        <label><input type="checkbox" name="color" value="blue">개인정보 제 3자 제공 동의</label>
                        <a>보기</a>
                    </div>
                    <div>
                        <label><input type="checkbox" name="color" value="blue">책임 규정에 대한 동의</label>
                        <a>보기</a>
                    </div>
                </div>
            </div>
        </div>

        <div style="display: flex; justify-content: center;">
            <button class="pay_btn">결제예약</button>
        </div>
    </div>
</body>
</html>
