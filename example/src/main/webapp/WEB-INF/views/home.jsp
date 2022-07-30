<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<% String id = (String)session.getAttribute("id"); %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>home</title>
  <link href="resources/css/style.css" rel="stylesheet"/>
  <!-- 제이쿼리 불러오기 -->  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

  <!-- Slick 불러오기 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
  <script>
    $(function () {
      $('.sale').slick({
        infinite: true, //양방향 무한 모션
        autoplay: true, //자동 스크롤 사용 여부
        autoplaySpeed: 3000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
        slidesToShow: 4, // 한 화면에 보여질 컨텐츠 개수
        slidesToScroll: 1, //스크롤 한번에 움직일 컨텐츠 개수
        arrows: false,
        dots: true
      });
    });
  </script>
</head>

<body>
  <div class="container">
    <!--헤더-->
    <header>
      <div class="head">
        <img src="https://dummyimage.com/150x100/c2c2c2/000000&text=+LOGO" class="logo" alt="로고">
        <%if(id == null) { %>
        <a href="/Login"><input type="button" class="btn" value="login"></a>
        <%} else {%>
        <a href="/Logout"><input type="button" class="btn" value="logout"></a>
        <% } %>
      </div>
    </header>
    <!--이미지 슬라이드-->
    <div class="slide">
      <div class="titleimage">
        <a href="#">
          <img src="https://dummyimage.com/960x500/858585/000000&text=x" alt="슬라이드메뉴">
        </a>
        <a href="#">
          <img src="https://dummyimage.com/960x500/b3b3b3/000000&text=x" alt="슬라이드메뉴">
        </a>
        <a href="#">
          <img src="https://dummyimage.com/960x500/3d3d3d/000000&text=x" alt="슬라이드메뉴">
        </a>
      </div>
    </div>
    <!--카테고리-->
    <div class="category">
      <!--카테고리 중 캠핑-->
      <div class="category_menu">
        <a href="/board/list?type=T&keyword=&type=C&category=캠핑"><img src="resources/image/camping_icon.png">
          <p class="menu_name">캠핑</p>
          
        </a>
      </div>

      <!--카테고리 중 글램핑-->
      <div class="category_menu">
        <a href="/board/list?type=T&keyword=&type=C&category=글램핑"><img src="resources/image/glamping_icon.png">
          <p class="menu_name">글램핑</p>
        </a>
      </div>

      <!--카테고리 중 카라반-->
      <div class="category_menu">
        <a href="/board/list?type=T&keyword=&type=C&category=카라반"><img src="resources/image/caravan_icon.png">
          <p class="menu_name">카라반</p>
   
        </a>
      </div>

      <!--카테고리 중 펜션-->
      <div class="category_menu">
        <a href="/board/list?type=T&keyword=&type=C&category=펜션"><img src="resources/image/pension_icon.png">
          <p class="menu_name">펜션</p>
        </a>
      </div>
    </div>
    <form id ="searchForm" action="/board/list" method="get">
    <!--검색-->
    <div class="main_search">
      <div class="search_box">
        <!--체크인/체크아웃-->
       	<input type="hidden" name="pageNum" value=1>
       	<input type="hidden" name="amount" value=4>
       	<input type="hidden" name="type" value="">
        <input type="date" class="search_date" name="startDate" value='startDate' <c:out value="${pageMaker.cri.startDate}"/>>  
       
        <input type="date" class="search_date" name="endDate" value='endDate' <c:out value="${pageMaker.cri.endDate}"/>> 
        
        <!--지역선택-->
       
        <img src="resources/image/pin.png"><input type="text" class="search_region" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>' placeholder="지역 선택">
        <!--카테고리 선택-->
       
        <img src="resources/image/hashtag.png"><input type="text" class="search_category" name="category"  value='<c:out value="${pageMaker.cri.category}"/>' placeholder="카테고리 선택">
      </div>
      
      <!--검색버튼-->
      <button class="search_btn">검색</button>
    </div>
    </form>
    <!--세일 목록-->
    <div class="sale">
      <div><a href="#"><img class="sale-img" src="https://dummyimage.com/180x180/000000/fff"></a></div>
      <div><a href="#"><img class="sale-img" src="https://dummyimage.com/180x180/000000/fff"></a></div>
      <div><a href="#"><img class="sale-img" src="https://dummyimage.com/180x180/000000/fff"></a></div>
      <div><a href="#"><img class="sale-img" src="https://dummyimage.com/180x180/000000/fff"></a></div>
      <div><a href="#"><img class="sale-img" src="https://dummyimage.com/180x180/000000/fff"></a></div>
      <div><a href="#"><img class="sale-img" src="https://dummyimage.com/180x180/000000/fff"></a></div>
      <div><a href="#"><img class="sale-img" src="https://dummyimage.com/180x180/000000/fff"></a></div>
      <div><a href="#"><img class="sale-img" src="https://dummyimage.com/180x180/000000/fff"></a></div>
      <div><a href="#"><img class="sale-img" src="https://dummyimage.com/180x180/000000/fff"></a></div>
      <div><a href="#"><img class="sale-img" src="https://dummyimage.com/180x180/000000/fff"></a></div>
    </div>
    <!--위클리 top 캠핑장-->
    <div class="weekly">

      <!--위클리 top 캠핑장 태그-->
      <p class="weekly-top">위클리 TOP 캠핑장</p>

      <!--위클리 top 캠핑장 container-->
      <div class="weekly-container">
        <!--위클리 top 캠핑장 img-->
        <a href="#"><img class="weekly-img" src="https://dummyimage.com/200x150/000htt/fff"></a>

        <!--위클리 top 캠핑장 설명-->
        <p class="weekly-describe">Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem mollitia
          laboriosam odio nobis omnis
          consectetur tempore sapiente animi fugit optio? Tempora voluptates hic voluptas ducimus eaque praesentium
          molestiae, iste asperiores.</p>

        <!--위클리 top 캠핑장 가격-->
        <p class="weekly-price">50,000원</p>

      </div>

      <!--위클리 top 캠핑장 container-->
      <div class="weekly-container">
        <!--위클리 top 캠핑장 img-->
        <a href="#"><img class="weekly-img" src="https://dummyimage.com/200x150/000htt/fff"></a>

        <!--위클리 top 캠핑장 설명-->
        <p class="weekly-describe">Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem mollitia
          laboriosam odio nobis omnis
          consectetur tempore sapiente animi fugit optio? Tempora voluptates hic voluptas ducimus eaque praesentium
          molestiae, iste asperiores.</p>

        <!--위클리 top 캠핑장 가격-->
        <p class="weekly-price">70,000원</p>

      </div>
    </div>
    <!-- hot -->
    <div class="hot">
      <p class="hot_banner">지금 뜨고 있는 캠핑장</p>
      <div class="hot1">
        <a href="#">
          <img src="https://dummyimage.com/340x200/000/fff&text=x">
        </a>
      </div>
      <div class="hot2">
        <a href="#">
          <img src="https://dummyimage.com/340x200/000/fff&text=x">
        </a>
      </div>
    </div>
    <!-- 푸터 -->
    <div class="foot">
    <footer>
      <br>
      <br>
      <ul>
        <li><a href="#">회사소개</a></li>
        <li><a href="#">이용약관</a></li>
        <li><a href="#">개인정보처리방침</a></li>
        <li><a href="#">사업자정보확인</a></li>
      </ul>
      <p class="company">
        @YaCamping Corp.
      </p>
      <br>
      <br>
      <br>
      <p>
        야캠핑어때는 통신판매 중개자로서 통신판매의 당사자가 아니며 상품의 예약,이용 및 환불 등과 관련한 의무와 책임 등 모든 거래에 대한 책임은 가맹점에게 있습니다.
        <br>
        상호 : 야캠핑어때 주식회사 │소재지 : 경기 수원시 영통구 영통로217번길 6 3층 │ 고객센터 : @@@-@@@-@@@@ <br>메일 : ###@email.com
      </p>
    </footer>
    </div>
  </div>
  <script src="resources/js/script.js"></script>
</body>
</html>