$(".funding_box").on("click", function(){

    $("#order_modal").css("display", "flex");

    let orderCode = $(this).data("order-code");

    $.ajax({
        url: "/funding/order/"+ orderCode,
        method: "GET",
        dataType: "json",
        success: result => {
            $("#modal_order_type").text(result.type);
            $("#modal_order_code").text(result.orderCode);
            $("#modal_funding_status").text(result.fundingStatus);
            $("#modal_title").text(result.title);
            $("#modal_funding_date").text(result.payDate);
            $("#modal_order_status").text(result.orderStatus);

            let html = '<div><button id="order_cancel_btn">펀딩 취소</button></div>';

            if(result.orderStatus !== "펀딩취소"){
                $(".modal_content").append(html);
                $("#order_cancel_btn").data("code", result.orderCode);
            }
        },
        error: error => console.log(error)
    });
});

$("#order_modal_close").on("click", () => {
    $("#order_modal").css("display", "none");
    $("#order_cancel_btn").closest('div').remove();
});

$(document).on("click", "#order_cancel_btn", function(){
    console.log($(this).data("code"));

    $.ajax({
        url: "/funding/order/" + $(this).data("code") + "?statusCode=50",
        method: "PATCH",
        success: result => {
            alert("취소 완료");
            window.location.reload();
        },
        error: error => console.log(error)
    });
});