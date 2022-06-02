//재료 추가
var del_count=0;
function add_Ingredients(){
    var ingre_name = document.getElementById("i_name").value;
    var quantity = document.getElementById("quantity").value;
    if(ingre_name==''  || quantity == ''){
        alert("재료명과 개수를 입력해주세요.")
    }else{
        var html = '<div class="ingredients_box">' 
        +'<div>'
        +'<p>' + ingre_name + '&nbsp;&nbsp;'+'</p>'
        +'</div>'
        +'<div class="del_btn_area">'
        +'<p>'+ '&nbsp;&nbsp;' + quantity +'</p>'
        +'<button type="button" class="ingredients_del_btn">'
        +'<img width="10" src="/resources/img/icon/delete_icon_whtie.png">'
        +'</button>'
        +'</div>'
        +'<input type="hidden" name="ingre_code" value="'+ingre_name+'">'
        +'<input type="hidden" name="ingre_qua" value='+quantity+'">'
        +'</div>';
        
        $("#ingredients_order").append(html);

        $('#name').val('');
        $('#quantity').val('');
}
};

//재료 삭제
$(document).on("click","ingredients_del_btn",function(){
    $(this).closest('.ingredients_box').remove();
});