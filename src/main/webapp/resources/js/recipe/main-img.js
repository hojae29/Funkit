let maxSize = 1048576; //1MB

function mainPreview(input) {
    var file_kind = input.value.lastIndexOf('.');
    var file_name = input.value.substring(file_kind+1,input.length);
    var file_type = file_name.toLowerCase();
    var check_file_type=new Array();

    check_file_type=['jpg','gif','png','jpeg','bmp','tif'];



    if(check_file_type.indexOf(file_type)==-1) {
        alert('이미지 파일만 선택할 수 있습니다');

        $("#img").val("");
        document.getElementById("preview").src="";
        var parent_Input=input.parentNode;
        var node=parent_Input.replaceChild(input.cloneNode(true),input);



        return false;

    }
        if(input.files && input.files[0]){
            var reader = new FileReader();
            reader.onload = function(e){
                document.getElementById("preview").src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        }else{
            document.getElementById("preview").src="";
    }
    let formData = new FormData();
    let fileInput = $('input[name="mainImage"]');
    let fileList = fileInput[0].files;
    let fileObj = fileList[0];

    if(!fileCheck(fileObj.size)){
        return false;
    }
    formData.append("mainImage",fileObj);

    $.ajax({
        url:'/recipe/uploadAjaxAction',
        processData : false,
        contentType : false,
        data : formData,
        type : 'POST',
        dataType:'json'
    });
}

function fileCheck(fileSize){

    if(fileSize >= maxSize) {
        alert("파일 사이즈 초과");
        return false;
    }
    return true;
}
