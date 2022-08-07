// 왼쪽 버튼 이미지 클릭 시 동작
window.addEventListener("load", () => {
  var leftBtn = document.querySelector(".leftbtn");
  var arrImg = ['../resources/image/a1.jpg', '../resources/image/a2.jpg', '../resources/image/a3.jpg'];
  var cntleft = 1;
  leftBtn.onclick = function () {
    var mainImg = document.querySelector("#list_image");
    if (cntleft >= arrImg.length) {
      cntleft = 0;
    }
    cntleft++;
    mainImg.style.backgroundImage = "url(" + arrImg[cntleft - 1] + ")";
  }
});

// 오른 쪽 버튼 이미지 클릭 시 동작
window.addEventListener("load", () => {
  var rightBtn = document.querySelector(".rightbtn");
  var arrImg = ['../resources/image/a1.jpg', '../resources/image/a2.jpg', '../resources/image/a3.jpg'];
  var cntright = arrImg.length;
  rightBtn.onclick = function () {
    var mainImg = document.querySelector("#list_image");
    cntright--;
    if (cntright < 0) {
      cntright = arrImg.length - 1;
    }
    mainImg.style.backgroundImage = "url(" + arrImg[cntright] + ")";
  }
});
