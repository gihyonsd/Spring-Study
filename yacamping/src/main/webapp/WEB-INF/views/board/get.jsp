<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replace", "\n"); %>
<% String id = (String)session.getAttribute("id"); %>

<c:set var = "path" value = "${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>야캠핑어때 캠핑장 상세정보</title>
  <link href="${path}/resources/css/detail_info.css" rel="stylesheet" />
  <!-- 제이쿼리 불러오기 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard-polyfill/2.8.6/clipboard-polyfill.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f2b287d5c416736a802c07ae457f6e0"></script>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>

<body>
  <!--전체영역 감싸기-->
  <div class="container">

    <!--전체 컨텐츠 영역-->
    <div class="allcontent">

      <!-----------------헤더 시작----------------->
      <header class="header">
        <div class="head">
          <!--로고이미지&타이틀-->
          <a href="/"><img src="${path}/resources/image/logo-1.png" class="logo" alt="로고">
          <div class="logotitle">야캠핑어때</div></a>

 		  <!--로그인아이콘(유저아이콘)-->
          <ul class="login">
            <li>
              <img src="${path}/resources/image/user-logo.png" class="userlogo" alt="사용자로고">
            <ul class="menu">
              <%if(id == null) {%> 
              <li><a href="/Login">로그인</a></li>
              <li><a href="/Agree">회원가입</a></li>
              <% } else { %>
              <li><a href="/Logout">로그아웃</a></li>
              <li><a href="/Agree">마이페이지</a></li>
              <% } %>
            </ul>
            </li>
          </ul>

      </header>
      <!-----------------헤더 끝----------------->

      <!-----------------섬네일 이미지 클릭 시 확대 시작----------------->

      <div class="main_img">

        <!--확대된 이미지-->
        <div id="zoom_img">
          <img src="${board.firstimageurl }" alt="image1" class="zoomimg">
        </div>

        <!--섬네일 리스트-->
        <ul class="thumb">

          <!--섬네일1-->
          <li class="on">
            <a href="#">
              <img src="${board.firstimageurl }" alt="image1">
            </a>
          </li>
          <!--섬네일2-->
          <li>
            <a href="#">
              <img src="${board.secondimageurl }" alt="image2">
            </a>
          </li>
          <!--섬네일3-->
          <li>
            <a href="#">
              <img src="${board.thirdimageurl }" alt="image3">
            </a>
          </li>
          <!--섬네일4-->
          <li>
            <a href="#">
              <img src="${board.firthimageurl }" alt="image4">
            </a>
          </li>
        </ul>
      </div>
      <!-----------------섬네일 이미지 클릭 시 확대 끝----------------->

      <!-----------------메일 타이틀 시작----------------->

      <div class="main_title">

        <!--해쉬태그-->
        <div class="reco_hashtag">
          <div class="hashtag">#실시간예약</div>
          <div class="hashtag">#포인트적립</div>
          <div class="hashtag">#포인트사용</div>
          <div class="hashtag">#양도가능</div>
        </div>
        <br>
        <div class="title">
          <h2>${board.facltnm} </h2>
          <h4>${board.tel }</h4>
          <div class="address">
            <input id="myInput" value="${board.addr1 }" readonly>
            <button onclick="copy_to_clipboard()"><img src="${path}/resources/image/copy.png" alt="주소 복사">
              <p>주소 복사</p>
            </button>
          </div>
          <div class="price"> <fmt:formatNumber value="${board.price}" pattern="#,###"/>원~</div>
        </div>

        <div class="visit">
          최근 한달 동안 <span>1,379명</span> 방문 | <span>64명</span>이 예약하였습니다.
        </div>
      </div>

      <!-----------------메일 타이틀 끝----------------->

      <!-----------------캠핑장 소개 시작----------------->

      <div class="introduce">
        <div class="intro">캠핑장 소개</div>
        <div class="intro_detail">
          <div class="box">
            <div class="content">
            	${fn:replace(board.intro, replace, "<br/>") }
            </div>
          </div>
        </div>
      </div>

      <!-----------------캠핑장 소개 끝----------------->

      <!-----------------이용안내 중 기본정보 시작----------------->


      <div class="intro1">이용안내</div>
      <div class="basic_information">
        <p class="tit">기본정보</p>



        <ul class="icon_txt">
          <dl>
            <dt>관련 사이트</dt>
            <dd>
              <a href="${board.homepage}">${board.homepage}</a>
            </dd>
          </dl>


          <dl>
            <dt>운영형태</dt>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/a1.png">
              </div>
              <div class="txt">오토캠핑</div>
            </dd>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/a2.png">
              </div>
              <div class="txt">카라반</div>
            </dd>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/a3.png">
              </div>
              <div class="txt">글램핑</div>
            </dd>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/a4.png">
              </div>
              <div class="txt">펜션</div>
            </dd>
          </dl>

          <dl>
            <dt>편의시설</dt>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/b1.png">
              </div>
              <div class="txt">공용화장실</div>
            </dd>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/b2.png">
              </div>
              <div class="txt">공용샤워장</div>
            </dd>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/b3.png">
              </div>
              <div class="txt">개수대</div>
            </dd>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/b4.png">
              </div>
              <div class="txt">매점</div>
            </dd>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/b5.png">
              </div>
              <div class="txt">와이파이</div>
            </dd>
          </dl>

          <dl>
            <dt>이용가능</dt>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/ico_camp_atype_01.png">
              </div>
              <div class="txt">놀이시설</div>
            </dd>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/ico_camp_atype_02.png">
              </div>
              <div class="txt">수영장</div>
            </dd>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/ico_camp_atype_03.png">
              </div>
              <div class="txt">트램플린</div>
            </dd>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/ico_camp_atype_04.png">
              </div>
              <div class="txt">체험활동</div>
            </dd>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/c5.png">
              </div>
              <div class="txt">장비대여</div>
            </dd>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/c6.png">
              </div>
              <div class="txt">반려동물</div>
            </dd>
          </dl>

          <dl>
            <dt>레저</dt>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/d1.png">
              </div>
              <div class="txt">수상레저</div>
            </dd>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/d2.png">
              </div>
              <div class="txt">낚시</div>
            </dd>

            <dd>
              <div class="icon">
                <img src="${path}/resources/image/이용안내 아이콘/d3.png">
              </div>
              <div class="txt">등산</div>
            </dd>
          </dl>
        </ul>

      </div>

      <!-----------------이용안내 중 기본정보 끝----------------->

      <!-----------------이용안내 중 예약정보 시작----------------->

      <div class="reservation_information">
        <p class="tit">예약정보</p>

        <ul class="reser_info">

          <dl>
            <dt>예약가능일</dt>
            <dd>
              <div class="txt2">~2023.01.01</div>
            </dd>
          </dl>

          <dl>
            <dt>예약오픈일</dt>
            <dd>
              <div class="txt2">매일 10시 / 5개월 단위</div>
            </dd>
          </dl>

          <dl>
            <dt>예약가능일수</dt>
            <dd>
              <div class="txt2">최대 6박 7일</div>
            </dd>
          </dl>

          <dl>
            <dt><span style="width:95px;">예약가능사이트수</span></dt>
            <dd>
              <div class="txt2">최대 24개 사이트</div>
            </dd>
          </dl>

          <dl>
            <dt>성수기</dt>
            <dd>
              <div class="txt2">2022.07.12~2022.08.18</div>
            </dd>
          </dl>

          <dl>
            <dt>준성수기</dt>
            <dd>
              <div class="txt2">2022.08.19~2022.09.01</div>
            </dd>
          </dl>
        </ul>
      </div>

      <!-----------------이용안내 중 예약정보 끝----------------->

      <!-----------------이용안내 중 이용시간 안내 시작----------------->

      <div class="time_information">
        <p class="tit">이용시간 안내</p>

        <div class="time_detail">

          <div class="camtime">입퇴실시간</div>
          <div class="in">입실 <span class="t_inout">13 : 00</span></div>
          <hr>
          <div class="out">퇴실 <span class="t_inout">11 : 00</span></div>

        </div>


        <div class="time_detail">

          <div class="mannertime">매너타임</div>
          <div class="in">시작 <span class="t_manner">23 : 00</span></div>
          <hr>
          <div class="out">종료 <span class="t_manner">07 : 00</span></div>

        </div>
      </div>

      <!-----------------이용안내 중 이용시간 안내 끝----------------->

      <!-----------------이용안내 중 약도 시작----------------->

      <div class="maptitle">
        <p class="tit">약도</p>
        <div id="map"></div>
      </div>

      <!-----------------이용안내 중 약도 끝----------------->


      <!-----------------푸터 시작----------------->
      <footer class="footer">
        <div class="foot">

          <div class="foot_btn">
            <div class="share">
              <a href="javascript:sendLink()">
                <button>
                  <img src="${path}/resources/image/share.png" />
                </button>
              </a>
            </div>

            <div class="heart">
              <button><img src="${path}/resources/image/heart.png"></button>
            </div>
          </div>

          <div class="reservation_click">
            <button class="openBtn">예약하기</button>
            <div class="modal hidden">
              <div class="bg"></div>
              <c:choose>
              <c:when test="${empty setdate.startDate || empty setdate.endDate}">
              <%if (id == null) { %>
              <div class="modalBox1">
                <p>야캠핑어때 로그인 후 예약 가능합니다.</p>
                <div class="btn_log_close1">
                  <a href="/Login"><button class="gotolog">로그인 하러가기</button></a>
                  <button class="closeBtn">닫기</button>
              	</div>
              </div>
              <%} else { %>
              <div class="modalBox">
              <p>체크인 체크아웃 날짜를 선택해주세요.</p>
              <form action="/board/getbooking" method="get">
                <div class="inputdate">
                  <input type="text" placeholder="체크인" onfocus="(this.type='date')" name="startDate" class="checkdate"> ~ <input
                    type="text" placeholder="체크아웃" onfocus="(this.type='date')" name="endDate" class="checkdate">
              	</div> 
              <div class="btn_log_close">
                 <input type="hidden" name="campnum" value="${board.campnum}">
                 <input type="hidden" value="${pageMaker.cri.startDate }">
                 <input type="hidden" value="${pageMaker.cri.endDate }">
                 <button class="gotobooking">예약 하러가기</button>
                 <button  type="button" class="closeBtn">닫기</button>
              </div>
              </form>
              </div>
              <% } %>
              </c:when>
              <c:otherwise>
              <div class="modalBox1">
              <%if (id == null) { %>
              <p>야캠핑어때 로그인 후 예약 가능합니다.</p>
              <div class="btn_log_close1">
                  <a href="/Login"><button class="gotolog">로그인 하러가기</button></a>
                  <button class="closeBtn">닫기</button>
              </div>
              <%} else { %>
              <div class="modalBox1">
              <p>예약하려는 캠핑장이 확실하신가요?</p>
                  <div class="btn_log_close1">
                  <a href="/board/getbooking?campnum=${board.campnum}&&startDate=<fmt:formatDate value="${setdate.startDate}" pattern="yyyy-MM-dd"/>&&endDate=<fmt:formatDate value="${setdate.endDate}" pattern="yyyy-MM-dd"/>"><button class="gotobooking">예약 하러가기</button></a>
                  <button class="closeBtn">닫기</button>
                  </div>
              </div>
              <% } %>
              </div>
              </c:otherwise>
              </c:choose>

  
            </div>
          </div>

        </div>

      </footer>
      <!-----------------푸터 끝----------------->
    </div>
  </div>
  <script>
  /*약도 지도 api*/
  var mapx = ${board.mapx};
  var mapy = ${board.mapy};
  var container = document.getElementById('map');
  var options = {
      center: new kakao.maps.LatLng(mapy, mapx),
      level: 3
    };
  var map = new kakao.maps.Map(container, options);
  </script>
  <script src="${path}/resources/js/detail_info.js"></script>

</body>

</html>