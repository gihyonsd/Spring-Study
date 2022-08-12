<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<% String id = (String)session.getAttribute("id"); %>

<c:set var = "path" value = "${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>야캠핑어때</title>
  <link href="${path}/resources/css/style.css" rel="stylesheet" />
  <!-- 제이쿼리 불러오기 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <!-- Slick 불러오기 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
   
  <!--특가상품 슬라이드 스크립트-->
  <script>
    $(function () {
      $('.sale_content').slick({
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
  <!--전체영역 감싸기-->
  <div class="container">
	
    <!--전체 컨텐츠 영역-->
    <div class="allcontent">

      <!-----------------헤더 시작----------------->
      <header>
        <div class="head">
          <!--로고이미지&타이틀-->
          <img src="resources/image/logo-1.png" class="logo" alt="로고">
          <div class="logotitle">야캠핑어때
          </div>

 		  <!--로그인아이콘(유저아이콘)-->
          <ul class="login">
            <li>
              <img src="resources/image/user-logo.png" class="userlogo" alt="사용자로고">
            <ul class="menu">
              <%if(id == null) {%> 
              <li><a href="/Login">로그인</a></li>
              <li><a href="/Agree">회원가입</a></li>
              <% } else { %>
              <li><a href="/Logout">로그아웃</a></li>
              <li><a href="/mypage">마이페이지</a></li>
              <% } %>
            </ul>
            </li>
          </ul>
        </div>
      </header>
      <!-----------------헤더 끝----------------->

      <!-----------------이벤트 슬라이드 시작----------------->
      <div class="slide">

        <div class="slideimg">
          <a href="#">
            <img src="resources/image/event1.png" alt="슬라이드이미지">
          </a>
          <a href="#">
            <img src="resources/image/event2.png" alt="슬라이드이미지">
          </a>
          <a href="#">
            <img src="resources/image/event3.png" alt="슬라이드이미지">
          </a>
          <a href="#">
            <img src="resources/image/event4.png" alt="슬라이드이미지">
          </a>
        </div>
      </div>
      <!-----------------이벤트 슬라이드 끝----------------->

      <!-----------------카테고리 시작----------------->
      <div class="category">

        <!--카테고리 중 캠핑-->
        <div class="category_menu">
          <a href="/board/list?type=T&keyword=&type=C&category=캠핑장"><img src="resources/image/camping_icon.png">
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
      <!-----------------카테고리 끝----------------->
	  <form id ="searchForm" action="/board/list" method="get">
      <!-----------------날짜/지역/카테고리 검색 시작----------------->
      <div class="search">

        <div class="search_box">
          <!--체크인/체크아웃-->
        <input type="hidden" name="pageNum" value=1>
       	<input type="hidden" name="amount" value=4>
       	<input type="hidden" name="type" value="">
          <div class="condition">
            <input type="text" name="startDate" placeholder="체크인" onfocus="(this.type='date')" class="search_input1">
          </div>
          <div class="condition">
            <input type="text" name="endDate" placeholder="체크아웃" onfocus="(this.type='date')" class="search_input2">
          </div>

          <!--지역선택-->

          <div class="condition">
            <input id="result" name="keyword" placeholder='지역선택' class="search_input3" readonly>
          </div>

          <!--카테고리 선택-->
          <div class="condition">
            <select id="nation" name="category" class="search_input4">
              <option value="">카테고리 선택</option>
              <option value="캠핑장">캠핑장</option>
              <option value="글램핑">글램핑</option>
              <option value="카라반">카라반</option>
              <option value="펜션">펜션</option>
            </select>
          </div>
        </div>

        <!--검색버튼-->
        <button class="search_btn">검색</button>
      </div>
      </form>
      <!--지역 검색 모달창-->
      <div class="region_modal" id="modal">
        <div class="modal_content">
          <p>지역을 선택하세요</p>
          <input type="radio" value="강원도" onclick='getregion(event)' name="keyword" id="id1"><label for="id1">강원도</label>
          <input type="radio" value="경기도" onclick='getregion(event)' name="keyword" id="id2"><label for="id2">경기도</label>
          <input type="radio" value="경상남도" onclick='getregion(event)' name="keyword" id="id3"><label
            for="id3">경상남도</label>
          <input type="radio" value="경상북도" onclick='getregion(event)' name="keyword" id="id4"><label
            for="id4">경상북도</label>
          <input type="radio" value="대구시" onclick='getregion(event)' name="keyword" id="id5"><label for="id5">대구시</label>
          <input type="radio" value="부산시" onclick='getregion(event)' name="keyword" id="id6"><label for="id6">부산시</label>
          <input type="radio" value="서울시" onclick='getregion(event)' name="keyword" id="id7"><label for="id7">서울시</label>
          <input type="radio" value="울산시" onclick='getregion(event)' name="keyword" id="id8"><label for="id8">울산시</label>
          <input type="radio" value="인천시" onclick='getregion(event)' name="keyword" id="id9"><label for="id9">인천시</label>
          <input type="radio" value="전라남도" onclick='getregion(event)' name="keyword" id="id10"><label
            for="id10">전라남도</label>
          <input type="radio" value="전라북도" onclick='getregion(event)' name="keyword" id="id11"><label
            for="id11">전라북도</label>
          <input type="radio" value="제주도" onclick='getregion(event)' name="keyword" id="id12"><label
            for="id12">제주도</label>
          <input type="radio" value="충청남도" onclick='getregion(event)' name="keyword" id="id13"><label
            for="id13">충청남도</label>
          <input type="radio" value="충청북도" onclick='getregion(event)' name="keyword" id="id14"><label
            for="id14">충청북도</label>

          <input type="button" id="modal_close_btn" value="선택완료">
        </div>
        <div class="modal_layer" id="modal_layer"></div>
      </div>
      <!-----------------날짜/지역/카테고리 검색 끝----------------->

      <!-----------------특가상품 시작----------------->
      <div class="sale">

        <!--특가상품 타이틀-->
        <div class="headtitle">
          <div class="title">특가상품</div>
          <a href="#">
            <div class="more">더보기 ></div>
          </a>
        </div>

        <!--특가상품 내용-->
        <div class="sale_content">

          <!--특가상품 1-->
          <div class="saletext">
            <a href="#">
              <img class="sale_img" src="${data[0].firstimageurl }">
              <div class="saledetail">
                <div class="sale_cam_title">${data[0].facltnm }</div>
                <div class="sale_cam_ad">${data[0].addr1 }</div>
                <div class="sale_cam_pr"><fmt:formatNumber value="${data[0].price}" pattern="#,###"/>원~</div>
              </div>
            </a>
          </div>

          <!--특가상품 2-->
          <div class="saletext">
            <a href="/board/get?campnum=${data[1].campnum}">
              <img class="sale_img" src="${data[1].firstimageurl }">
              <div class="saledetail">
                <div class="sale_cam_title">${data[1].facltnm }</div>
                <div class="sale_cam_ad">${data[1].addr1 }</div>
                <div class="sale_cam_pr"><fmt:formatNumber value="${data[1].price}" pattern="#,###"/>원~</div>
              </div>
            </a>
          </div>

          <!--특가상품 3-->
          <div class="saletext">
            <a href="#">
              <img class="sale_img" src="${data[2].firstimageurl }">
              <div class="saledetail">
                <div class="sale_cam_title">${data[2].facltnm }</div>
                <div class="sale_cam_ad">${data[2].addr1 }</div>
                <div class="sale_cam_pr"><fmt:formatNumber value="${data[2].price}" pattern="#,###"/>원~</div>
              </div>
            </a>
          </div>

          <!--특가상품 4-->
          <div class="saletext">
            <a href="#">
              <img class="sale_img" src="${data[14].firstimageurl }">
              <div class="saledetail">
                <div class="sale_cam_title">${data[14].facltnm }</div>
                <div class="sale_cam_ad">${data[14].addr1 }</div>
                <div class="sale_cam_pr"><fmt:formatNumber value="${data[14].price}" pattern="#,###"/>원~</div>
              </div>
            </a>
          </div>

          <!--특가상품 5-->
          <div class="saletext">
            <a href="#">
              <img class="sale_img" src="${data[18].firstimageurl }">
              <div class="saledetail">
                <div class="sale_cam_title">${data[18].facltnm }</div>
                <div class="sale_cam_ad">${data[18].addr1 }</div>
                <div class="sale_cam_pr"><fmt:formatNumber value="${data[18].price}" pattern="#,###"/>원~</div>
              </div>
            </a>
          </div>

        </div>
      </div>
      <!-----------------특가상품 끝----------------->

      <!-----------------추천 캠핑장 시작----------------->
      <div class="recommend">

        <!--추천캠핑장 타이틀-->
        <div class="headtitle">
          <div class="title">추천 캠핑장</div>
          <div class="ad">광고</div>
          <a href="#">
            <div class="more">더보기 ></div>
          </a>
        </div>

        <!--추천 캠핑장 내용-->
        <div class="reco_content">

          <!--추천 캠핑장 링크 & 이미지-->
          <a href="#"><img class="reco_img" src="${data[19].thirdimageurl }">

            <!--추천 캠핑장 설명-->
            <p class="reco_title">${data[19].facltnm }</p>
            <p class="reco_describe">${data[19].lineintro }</p>
            <div class="reco_hashtag">
              <div class="hashtag">#커플여행</div>
              <div class="hashtag">#럭셔리여행</div>
              <div class="hashtag">#펜션</div>
              <div class="hashtag">#액티비티</div>
            </div>
            <!--추천 캠핑장 가격-->
            <div class="recommend_price">
              <div class="reco_price"><fmt:formatNumber value="${data[18].price}" pattern="#,###"/>원~</div>
              <div class="reco_reservation">예약가능</div>
            </div>
            
          </a>
        </div>

      </div>
      <!-----------------추천 캠핑장 끝----------------->

      <!-----------------매거진 시작----------------->
      <div class="magazine">

        <div class="headtitle">
          <div class="title">캠핑 Magazine</div>
          <a href="#">
            <div class="more">더보기 ></div>
          </a>
        </div>

        <div class="magazine_content">
          <a href="#">
            <img src="resources/image/h1.jpg">
            <div class="imgtext">초보 캠퍼를 위한 오토캠핑 입문 가이드</div>
            <div class="imgtextside">캠핑 시작 방법을 몰라 망설이는 초보 캠퍼들을 위한 노하우</div>
          </a>
        </div>

        <div class="magazine_content">
          <a href="#">
            <img src="resources/image/h2.jpg">
            <div class="imgtext">캠핑의 꽃은 음식 ! 캠핑 요리 리스트</div>
            <div class="imgtextside">요리 초보부터 고수까지 입맛대로 골라 먹는 캠핑 요리 추천</div>
          </a>
        </div>
      </div>
      <!-----------------매거진 끝----------------->

      <!-----------------푸터 시작----------------->
      <footer>

        <div class="footer_compony">
          <div class="footer_link">
            <div class="link_list"><a href="#">회사소개&nbsp;</a></div>|
            <div class="link_list"><a href="#">&nbsp;이용약관&nbsp;</a></div>|
            <div class="link_list"><a href="#">&nbsp;개인정보처리방침&nbsp;</a></div>|
            <div class="link_list"><a href="#">&nbsp;사업자정보확인</a></div>
          </div>

          <div class="corp">
            @YaCamping Corp.
          </div>
        </div>

        <div class="footer_content">
          <div class="footer_text">
            야캠핑어때는 통신판매 중개자로서 통신판매의 당사자가 아니며 상품의 예약,이용 및 환불 등과 관련한 의무와 책임 등 모든 거래에 대한 책임은 가맹점에게 있습니다.
          </div>
          <div class="compony_info">
            <span style="font-weight: bold;">야캠핑어때 주식회사</span> | 소재지 : 경기 수원시 영통구 영통로217번길 6 3층 | 사업자번호 : 752-80-1234 |
            고객센터 : 070-123-4567 | 메일 : yacamping@email.com
          </div>
          <div class="copyright">Copyright 야캠핑어때 COMMUNICATION. All rights reserved.</div>
        </div>
      </footer>
      <!-----------------푸터 끝----------------->

    </div>
  </div>
</body>
<!--슬라이드 스크립트 연결-->
<script src="resources/js/script.js"></script>

</html>