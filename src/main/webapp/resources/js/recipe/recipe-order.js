//조리 과정 순서 추가
var no = 1;
function add_order(){
    no++;

    var idx= $(".order_count").size();
    var addOrder = '<div id="orderNo_'+ no +'" class="order_count">'
        +'<div class="label_area">'
        +'<label class="cooking_orders">' + no + '</label>'
        +'</div>'
        +'<div class="img_button">'
        +'<a href="javascript:void(0)" onclick="fileUpload(' + no + ')">'
        +'<img src="/resources/img/recipe/default.png" id="order_img_' + no + '"/>'
        +'</a>'
        +'</div>'
        +'<input type="file" class="img_input" name="subImage" id="img_input_'+ no +'" accept="image/*">'
        +'<div>'
        +'<textarea placeholder="조리 과정을 입력해주세요." class="text_box" name="cookingProcess">' + '</textarea>'
        +'</div>'
        +'<input type="hidden" value="' + no + '" name="cookingSeq">'
        +'</div>';

    var orderHtml = $(".order_count:last");
    orderHtml.after(addOrder);
};

//조리 과정 순서 삭제
function del_order(){
    var idx=$(".order_count").size();
    if(idx>1){
        var orderNo="orderNo_"+idx;
        var last_order = document.getElementById(orderNo);
        last_order.remove();
        no--;
    }else{
        alert("더 이상 삭제할 수 없습니다.")
    }
}