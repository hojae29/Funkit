function FundingFilter(tagCode){
    let keyword = $("#search_funding").val(); //keyword
    let payInfo = $("#order_select").val(); //payInfo

    return "/funding/filter?tagCode=" + tagCode + "&keyword=" + keyword + "&payInfo=" + payInfo;
}

$(".tag_box").on("click", function(){
    $(".funding_container > .tag_box").remove();
    $.ajax({
        url: FundingFilter($(this).data("tag-code")),
        method: "GET",
        success: result => {
            makeFundingItem(result);

            $(".tag_box_hover").removeClass("tag_box_hover");
            $(".tag_box[data-tag-code=" + $(this).data("tag-code") + "]").addClass("tag_box_hover");
        },
        error: error => alert("불러오기 실패")
    });
});

$("#search_funding").on("keyup", function(key){
    if(key.keyCode === 13){ //Enter 누를 시
        $.ajax({
            url: FundingFilter($(".tag_box_hover").data("tag-code")),
            method: "GET",
            success: result => {
                makeFundingItem(result);
            },
            error: () => alert("불러오기 실패")
        });
    }
});

$("#order_select").on("change", function(){
    $.ajax({
        url: FundingFilter($(".tag_box_hover").data("tag-code")),
        method: "GET",
        success: result => {
            makeFundingItem(result);
        },
        error: () => alert("불러오기 실패")
    });
});

function makeFundingItem(list){
    let fundingItemHTML = "";
    list.forEach(item => {
        let tags = "";
        item.tags.forEach(item => tags += item.name + " ");

        let html =  '<div class="funding_item">'+
            '    <a href="/funding/' + item.fundingCode + '"><div class="funding_img_box" style="background-image: url(' + item.mainImage.location + item.mainImage.name + ')"></div></a>'+
            '    <div class="funding_title_container">'+
            '        <a class="funding_title" href="/funding/' + item.fundingCode + '">' + item.title + '</a>'+
            '    </div>'+
            '    <div style="display: flex;">'+
            '        <img class="tag_icon" src="/resources/img/icon/tag_icon.svg"/>'+
            '        <p class="tag_text">' + tags + '</p>'+
            '    </div>'+
            '    <div class="funding_percentage">'+
            '        <p>' + item.percentage + '%</p>'+
            '    </div>'+
            '    <div class="amount_container">'+
            '        <p>D-' + item.dday + '</p>'+
            '        <p>' + item.cmlAmount + '원</p>'+
            '    </div>'+
            '</div>';
        fundingItemHTML += html;
    });

    $(".funding_container > .funding_item").remove(); //기존 펀딩 삭제
    $(fundingItemHTML).appendTo(".funding_container").hide().fadeIn(300); //새로 펀딩 추가
}

function tagBoxHover(tagCode){
    $(".tag_box_hover").removeClass("tag_box_hover");
    $(".tag_box[data-tag-code=" + tagCode + "]").addClass("tag_box_hover");
}