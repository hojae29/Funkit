<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="/resources/css/funding/order/step2.css">
</head>
<body>
    <jsp:include page="../header.jsp"/>

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
        <div id="step1_container">
            <div class="type_container">
                <div><h2>투자 종류 선택</h2></div>
                <div class="type_box_wrap">
                    <div class="type_box" id="invest_type_btn">
                        <div style="width: 90%;">
                            <p class="type_title">지분</p>
                            <p class="type_info">원하는 금액을 투자합니다</p>
                        </div>
                    </div>
                    <div class="type_box" id="reward_type_btn">
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
                    <div class="funding_img_box" style="background-image: url('${funding.mainImage.location}${funding.mainImage.name}')"></div>
                    <div class="info_box">
                        <div>
                            <div><p class="fudning_title_text">${funding.title}</p></div>
                            <div><p class="fudning_info_text">${funding.introduction}</p></div>
                        </div>
                        <div>
                            <div><h2 class="funding_percentage">323%</h2></div>
                            <div class="funding_last_info">
                                <p>D-${funding.DDay}</p>
                                <P>${funding.cmlAmount}원</P>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <hr style="margin: 60px 0px 25px 0px;background-color: #cccccc;height: 1px;border: none;">

            <div class="invest_input_container">
                <div><h2>금액 입력</h2></div>
                <div class="input_container">
                    <div style="display: flex;align-items: flex-end;">
                        <input class="amount_input" id="invest_amount" type="text">
                        <p style="font-size: 16px; font-weight: 500;">원을 투자하겠습니다</p>
                    </div>
                    <button class="next_btn">다음</button>
                </div>
            </div>
            <div class="reward_input_container">
                <div><h2>리워드 선택</h2></div>
                <c:forEach var="reward" items="${funding.reward}">
                    <div class="reward_box">
                        <div style="display: flex;align-items: center;">
                            <input class="reward_checkbox" type="checkbox" value="${reward.rewardCode}" onclick='toggleNumBox(this)'>
                            <div>
                                <p>${reward.amount}원</p>
                                <p>${reward.title}</p>
                                <p>${reward.info}</p>
                            </div>
                        </div>
                        <div>
                            <input class="reward_quantity" type="number" min="0" max="${reward.quantity}" disabled>개
                        </div>
                    </div>
                </c:forEach>
                <button class="next_btn">다음</button>
            </div>
        </div>
        <div id="step2_container" style="display: none">
            <div>
                <div><h2>펀딩 정보</h2></div>
                <div><p>월간 랭킹 3달 연속 1등! 꾸덕촉촉 저세상 텐션, 브라우니 같은 하루 단백바!</p></div>
                <div>
                    <div class="text_box_wrap">
                        <div class="text_box">
                            <p>투자 형식</p>
                            <p id="funding_type"></p>
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
    </div>
    <script>
        function toggleNumBox(checkbox){
            let item = $(checkbox).closest(".reward_box").find(".reward_quantity");
            console.log(item.disabled);
            $(item).attr("disabled", !checkbox.checked);
        }

        let payInfo = {
            type: null,
            investAmount: null,
            rewardList: []
        };

        $("#invest_type_btn").on("click", function(){
            $(this).css("border", "1px solid #ff7e00")
                .find(".type_title").css("color", "#ff7e00");
            $("#reward_type_btn").css("border", "1px solid #cccccc")
                .find(".type_title").css("color", "black");
            $(".invest_input_container").css("display", "block");
            $(".reward_input_container").css("display", "none");
            payInfo.type = "invest";
        });

        $("#reward_type_btn").on("click", function(){
            $(this).css("border", "1px solid #ff7e00")
                .find(".type_title").css("color", "#ff7e00");
            $("#invest_type_btn").css("border", "1px solid #cccccc")
                .find(".type_title").css("color", "black");
            $(".reward_input_container").css("display", "block");
            $(".invest_input_container").css("display", "none");
            payInfo.type = "reward";
        });

        $(".next_btn").on("click", function() {
            if(payInfo.type === "invest")
                payInfo.investAmount = $("#invest_amount").val();
            else if(payInfo.type === "reward"){
                $(".reward_checkbox:checked").each(function(index, item){
                    let reward = {
                        rewardCode: $(item).val(),
                        quantity: $(item).closest(".reward_box").find(".reward_quantity").val()
                    }
                    payInfo.rewardList.push(reward);
                });
            }
            $("#step2_container").css("display", "block");
            $("#step1_container").css("display", "none");
            $(".step_box").eq(0).css("border-bottom", "3px solid white");
            $(".step_box").eq(1).css("border-bottom", "3px solid #ff7e00");
        });

    </script>
</body>
</html>
