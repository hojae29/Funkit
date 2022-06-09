<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                            <div><h2 class="funding_percentage">${funding.percentage}%</h2></div>
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
                                <p class="reward_amount" data-amount="${reward.amount}"><fmt:formatNumber value="${reward.amount}" pattern="#,###"/>원</p>
                                <p>${reward.title}</p>
                                <p style="font-size: 14px;color: #888888;">${reward.info}</p>
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
                            <p id="funding_amount"></p>
                        </div>
                        <div class="text_box">
                            <p>배송비</p>
                            <p>0원</p>
                        </div>
                    </div>
                    <div class="invest_info_wrap">
                        <div class="text_box">
                            <p>수익 지급일</p>
                            <p><fmt:formatDate value="${funding.deliveryDate}" pattern="yyyy-MM-dd"/></p>
                        </div>
                        <div class="text_box">
                            <p>수익 분배율</p>
                            <p>${funding.distribution}%</p>
                        </div>
                    </div>
                    <div class="reward_info_wrap">
                        <div class="text_box">
                            <p>리워드 발송일</p>
                            <p><fmt:formatDate value="${funding.deliveryDate}" pattern="yyyy-MM-dd"/></p>
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
                <div><h2>카드 정보입력</h2></div>
                <div class="card_info_container">
                    <div>
                        <div><label>카드번호</label></div>
                        <div>
                            <input class="card_info_input" id="card_num_1" type="text" maxlength="4"/>
                            <input class="card_info_input" id="card_num_2" type="text" maxlength="4"/>
                            <input class="card_info_input" id="card_num_3" type="text" maxlength="4"/>
                            <input class="card_info_input" id="card_num_4" type="text" maxlength="4"/>
                        </div>
                    </div>
                    <div style="display: flex; justify-content: space-between;">
                        <div>
                            <div><label>유효기간</label></div>
                            <div>
                                <select class="card_info_input" id="card_expiry_year">
                                    <option value="2022">2022년</option>
                                    <option value="2023">2023년</option>
                                    <option value="2024">2024년</option>
                                    <option value="2025">2025년</option>
                                    <option value="2026">2026년</option>
                                    <option value="2027">2027년</option>
                                    <option value="2028">2028년</option>
                                </select>
                                <select class="card_info_input" id="card_expiry_month">
                                    <option value="01">1월</option>
                                    <option value="02">2월</option>
                                    <option value="03">3월</option>
                                    <option value="04">4월</option>
                                    <option value="05">5월</option>
                                    <option value="06">6월</option>
                                    <option value="07">7월</option>
                                    <option value="08">8월</option>
                                    <option value="09">9월</option>
                                    <option value="10">10월</option>
                                    <option value="11">11월</option>
                                    <option value="12">12월</option>
                                </select>
                            </div>
                        </div>
                        <div>
                            <div><label>생년월일</label></div>
                            <div><input class="card_info_input" id="card_birth" type="text" maxlength="6"/></div>
                        </div>
                    </div>
                    <div>
                        <div><label>카드 비밀번호 앞 2자리</label></div>
                        <div><input class="card_info_input" id="card_passwd" type="text" maxlength="2"/></div>
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
            rewardList: [],
            totalAmount: null,
            cardNumber: null,
            expiry: null,
            birth: null,
            cardPasswd: null,
        };

        $(".pay_btn").on("click", () => {
            payInfo.cardNumber = $("#card_num_1").val() + "-" + $("#card_num_2").val() + "-" + $("#card_num_3").val() + "-" + $("#card_num_4").val();
            payInfo.expiry = $("#card_expiry_year").val() + "-" + $("#card_expiry_month").val();
            payInfo.birth = $("#card_birth").val();
            payInfo.cardPasswd = $("#card_passwd").val();

            $.ajax({
                url: window.location.pathname,
                method: "POST",
                contentType: "application/json",
                data: JSON.stringify(payInfo),
                success: result => alert("결제예약이 완료됐습니다"),
                error: error => console.log(error)
            });
        });

        $("#invest_type_btn").on("click", function(){
            $(this).css("border", "1px solid #ff7e00")
                .find(".type_title").css("color", "#ff7e00");
            $("#reward_type_btn").css("border", "1px solid #cccccc")
                .find(".type_title").css("color", "black");
            $(".invest_input_container").css("display", "block");
            $(".reward_input_container").css("display", "none");
            payInfo.type = "지분";
        });

        $("#reward_type_btn").on("click", function(){
            $(this).css("border", "1px solid #ff7e00")
                .find(".type_title").css("color", "#ff7e00");
            $("#invest_type_btn").css("border", "1px solid #cccccc")
                .find(".type_title").css("color", "black");
            $(".reward_input_container").css("display", "flex");
            $(".invest_input_container").css("display", "none");
            payInfo.type = "리워드";
        });

        $(".next_btn").on("click", function() {
            if(payInfo.type === "지분"){
                $("#funding_type").text(payInfo.type);
                payInfo.totalAmount = $("#invest_amount").val();
                $("#funding_amount").text(payInfo.totalAmount + "원");
                $(".invest_info_wrap").css("display", "block");
            }
            else if(payInfo.type === "리워드"){
                $("#funding_type").text(payInfo.type);
                $(".reward_checkbox:checked").each(function(index, item){
                    let reward = {
                        rewardCode: $(item).val(),
                        quantity: $(item).closest(".reward_box").find(".reward_quantity").val(),
                        amount: Number($(item).closest(".reward_box").find(".reward_amount").data("amount"))
                    }
                    payInfo.rewardList.push(reward);
                });

                //결제 총 금액
                for(let index=0; index < payInfo.rewardList.length; index++)
                    payInfo.totalAmount += payInfo.rewardList[index].amount * payInfo.rewardList[index].quantity;

                $("#funding_amount").text(payInfo.totalAmount + "원");

                $(".reward_info_wrap").css("display", "block");
            }

            $("#step2_container").css("display", "block");
            $("#step1_container").css("display", "none");
            $(".step_box").eq(0).css("border-bottom", "3px solid white");
            $(".step_box").eq(1).css("border-bottom", "3px solid #ff7e00");
        });

    </script>
</body>
</html>
