$("#tag_add_btn").on("click", () => {
    let html = '<div class="tag_box">' + $("#tag_select option:checked").text() +
        '<button type="button" class="tag_delete_btn">' +
        '<img width="10" src="/resources/img/icon/close_icon_white.svg">' +
        '</button>' +
        '<input type="hidden" name="tagCode" value="' + $("#tag_select").val() + '">' +
        '</div>';

    if($("#tag_list_box input[value=" + $("#tag_select").val() + "]").length < 1)
        $("#tag_list_box").append(html);
});

$(document).on("click", ".tag_delete_btn", function(){
    $(this).closest('.tag_box').remove();
});