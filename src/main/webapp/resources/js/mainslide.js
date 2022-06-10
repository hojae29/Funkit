let banner_time=setInterval(nextSlide,5000); //x000 는 x초 ex:5000 은 5초

let slides = document.querySelector(".slides");
    let slideImg = document.querySelectorAll(".slides li");
    currentIdx = 0;
    slideCount = slideImg.length;
    prev = document.querySelector(".prev"); //이전버튼
    next = document.querySelector(".next"); //다음버튼
    slideWidth = 800;//슬라이드 이미지 넓이

    makeClone(); //처음 이미지와 마지막 이미지 복사 함수
    initfunction(); // 슬라이드 넓이와 위치 값 초기화 함수

    function makeClone(){
      let cloneSlide_first = slideImg[0].cloneNode(true);
      //slideImg.firstElementChild.cloneNode(true);
      let cloneSlide_last = slides.lastElementChild.cloneNode(true);
      slides.append(cloneSlide_first); 
      slides.insertBefore(cloneSlide_last,slides.firstElementChild);
    }

    function initfunction(){
      slides.style.width = (slideWidth) * (slideCount+2) + "px";
      slides.style.left = -(slideWidth) + "px";
    }

    next.addEventListener('click', function (){
      nextSlide();
    });

    function nextSlide(){
      if (currentIdx <= slideCount-1) {
        slides.style.left = -(currentIdx+2) * (slideWidth) + "px";//슬라이드 이동할때
        slides.style.transition = `${0.5}s ease-out`;
      }
      if (currentIdx === slideCount-1){
        setTimeout(function(){
          slides.style.left = -(slideWidth) + "px";
          slides.style.transition = `${0}s ease-out`;
        },500);
        currentIdx = -1;
        } 
        currentIdx+=1;
      }
    prev.addEventListener('click', function () {
      console.log(currentIdx);
        if (currentIdx >= 0) {
          slides.style.left = -(currentIdx) * (slideWidth) + "px";
          slides.style.transition = `${0.5}s ease-out`;
        }if (currentIdx === 0){
          setTimeout(function(){
            slides.style.left = -(slideCount) * (slideWidth)+ "px";
            slides.style.transition = `${0}s ease-out`;
          },500);
          currentIdx=slideCount;
          } 
          currentIdx-=1;
        }
    );
