function add_order(){
    var idx= $(".order_count").size();
    var no = idx+1;
    var addOrder = '<div id="orderNo_'+no+'" class="order_count">'
        +'<div class="label_area">'
        +'<label class="cooking_orders">' + no + '</label>'
        +'</div>'
        +'<div class="img_button">'
        +'<label for="img_input_'+no+'">이미지 업로드' + '</label>'
        +'</div>'
        +'<input type="file" class="img_input" id="img_input_'+no+'"  accept="image/*">'
        +'<div>'
        +'<textarea placeholder="조리 과정을 입력해주세요." class="text_box">' + '</textarea>'
        +'</div>'
        +'</div>';

    var orderHtml = $(".order_count:last");
    orderHtml.after(addOrder);

};

function del_order(){
    var idx=$(".order_count").size();
    if(idx>1){
        var orderNo="orderNo_"+idx;
        var last_order = document.getElementById(orderNo);
        last_order.remove();
    }else{
        alert("더 이상 삭제할 수 없습니다.")
    }
}