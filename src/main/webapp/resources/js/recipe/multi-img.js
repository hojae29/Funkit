function fileUpload(num){

    $("#img_input_" + num).trigger('click');
    
    var file = document.querySelector("#img_input_" + num);

    file.onchange = function () {
        var fileList = file.files;

        // 읽기
        var reader = new FileReader();
        reader.readAsDataURL(fileList[0]);

        //로드 한 후
        reader.onload = function () {

            //썸네일 이미지 생성
            var showImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화

            showImage.src = reader.result; //data-uri를 이미지 객체에 주입
            showImage.onload = function () {

                //리사이즈를 위해 캔버스 객체 생성
                var canvas = document.createElement('canvas');
                var canvasContext = canvas.getContext("2d");

                //캔버스 크기 설정
                canvas.width = 115;
                canvas.height = 115;

                //이미지를 캔버스에 그리기
                canvasContext.drawImage(this, 0, 0, 115, 115);

                //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
                var dataURI = canvas.toDataURL("image/jpeg");

                //썸네일 이미지 보여주기
                document.querySelector("#order_img_" + num).src = dataURI;

            };
        };
    };
}
