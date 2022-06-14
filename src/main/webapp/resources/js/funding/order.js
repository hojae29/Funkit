function toggleNumBox(checkbox){
    let item = $(checkbox).closest(".reward_box").find(".reward_quantity");
    console.log(item.disabled);
    $(item).attr("disabled", !checkbox.checked);
}

let order = {
    type: null,
    rewardList: [],
    totalAmount: null,
    cardNumber: null,
    expiry: null,
    birth: null,
    cardPasswd: null,
};

$(".pay_btn").on("click", () => {
    order.cardNumber = $("#card_num_1").val() + "-" + $("#card_num_2").val() + "-" + $("#card_num_3").val() + "-" + $("#card_num_4").val();
    order.expiry = $("#card_expiry_year").val() + "-" + $("#card_expiry_month").val();
    order.birth = $("#card_birth").val();
    order.cardPasswd = $("#card_passwd").val();

    $.ajax({
        url: window.location.pathname,
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify(order),
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
    order.type = "지분";
});

$("#reward_type_btn").on("click", function(){
    $(this).css("border", "1px solid #ff7e00")
        .find(".type_title").css("color", "#ff7e00");
    $("#invest_type_btn").css("border", "1px solid #cccccc")
        .find(".type_title").css("color", "black");
    $(".reward_input_container").css("display", "flex");
    $(".invest_input_container").css("display", "none");
    order.type = "리워드";
});

$(".next_btn").on("click", function() {
    if(order.type === "지분"){
        $("#funding_type").text(order.type);
        order.totalAmount = $("#invest_amount").val();
        $("#funding_amount").text(order.totalAmount + "원");
        $(".invest_info_wrap").css("display", "block");
    }
    else if(order.type === "리워드"){
        $("#funding_type").text(order.type);
        $(".reward_checkbox:checked").each(function(index, item){
            let reward = {
                rewardCode: $(item).val(),
                quantity: $(item).closest(".reward_box").find(".reward_quantity").val(),
                amount: Number($(item).closest(".reward_box").find(".reward_amount").data("amount"))
            }
            order.rewardList.push(reward);
        });

        //결제 총 금액
        for(let index=0; index < order.rewardList.length; index++)
            order.totalAmount += order.rewardList[index].amount * order.rewardList[index].quantity;

        $("#funding_amount").text(order.totalAmount + "원");

        $(".reward_info_wrap").css("display", "block");
    }

    $("#step2_container").css("display", "block");
    $("#step1_container").css("display", "none");
    $(".step_box").eq(0).css("border-bottom", "3px solid white");
    $(".step_box").eq(1).css("border-bottom", "3px solid #ff7e00");
});