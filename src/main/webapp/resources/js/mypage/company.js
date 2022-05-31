function movePage(page){
    let menu = $("#menu_box").data("menu");

    $.ajax({
        url: window.location.pathname + "/" + menu + "?page=" + page,
        method: "GET",
        success: result => {
            $(".contents_box").empty();
            result.list.forEach(function(item){
                let location = "";
                if(item.mainImage != null)
                    location = item.mainImage.location + item.mainImage.name;
                let html = '<div class="funding_box">' +
                    '<div class="status_text">' + item.status + '</div>' +
                    `<div class="img_box" style="background-image: url('${location}')"></div>` +
                    '<div>' +
                    '<p class="funding_title">' + (item.title == null || item.title === "" ? "제작중인 프로젝트" : item.title) + '</p>' +
                    '</div>' +
                    '<div class="button_box">' +
                    '<button><a href="/myfunkit/company/funding/' + item.fundingCode + '">수정</a></button>' +
                    '<button data-code="' + item.fundingCode + '" id="delete_funding_btn">삭제</button>' +
                    '</div>' +
                    '</div>';

                $(".contents_box").append(html);
            });

            $("#pagination").empty();

            let prev = '<div><button onclick="movePage(1)"><<</button></div>' +
                '<div><button onclick="movePage(' + result.pager.prev + ');"><</button></div>';
            $("#pagination").append(prev);

            result.pager.list.forEach(function(item){
                let html;
                if(page === item)
                    html = '<div><button class="pagination_active" onclick="movePage(' + item + ');">' +  item + '</button></div>';
                else
                    html = '<div><button onclick="movePage(' + item + ');">' +  item + '</button></div>';
                $("#pagination").append(html);
            });

            let next = '<div><button onclick="movePage(' +  result.pager.next + ')">></button></div>' +
                '<div><button onclick="movePage(' + result.pager.last + ')">>></button></div>';
            $("#pagination").append(next);

            $("#pagination").data("page", page);
        },
        error: error => console.log(error)
    });
}

$(document).on("click", "#delete_funding_btn", function(){
    $.ajax({
        url: "/myfunkit/company/funding/" + $(this).data("code"),
        method: "DELETE",
        success: () => {
            $(this).closest('.funding_box').remove();
            if($(".funding_box").length < 1){
                if($("#pagination").data("page") !== 1)
                    movePage($("#pagination").data("page")-1);
            } else{
                movePage($("#pagination").data("page"));
            }
        },
        error: error => console.log(error)
    });
});