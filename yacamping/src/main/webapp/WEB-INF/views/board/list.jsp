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
    <title>야캠핑어때 캠핑장 리스트</title>
    <link type="text/css" rel="stylesheet" href="${path}/resources/css/list.css">
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
                    <a href="/"><img src="${path}/resources//image/logo-1.png" class="logo" alt="로고">
                    <div class="logotitle">야캠핑어때 </div></a>

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
	              <li><a href="/mypage">마이페이지</a></li>
	              <% } %>
	            </ul>
            </li>
          </ul>
         </div>
            </header>
            <!-----------------헤더 끝----------------->


            <!-----------------리스트 헤드라인 시작----------------->
            <div class="headline">
                <div class="index">
                    <p>검색내역</p>
                </div>
            </div>

            <!-----------------리스트 헤드라인 끝----------------->


            <!-----------------리스트 페이지 시작----------------->
            <!-- 리스트 헤드라인 / 사진 / 캠핑장이름 / 캠핑장 가격 / 한줄 소개 /주소/업종구분(일반야영장/글램핑/카라반/펜션)/ 페이징  -->
            <script>
            var img1 = '<c:out value="${list[0].firstimageurl}"/>';
            var img2 = '<c:out value="${list[0].secondimageurl}"/>';
            var img3 = '<c:out value="${list[0].thirdimageurl}"/>';
            var img4 = '<c:out value="${list[1].firstimageurl}"/>';
            var img5 = '<c:out value="${list[1].secondimageurl}"/>';
            var img6 = '<c:out value="${list[1].thirdimageurl}"/>';
            var img7 = '<c:out value="${list[2].firstimageurl}"/>';
            var img8 = '<c:out value="${list[2].secondimageurl}"/>';
            var img9 = '<c:out value="${list[2].thirdimageurl}"/>';
            var img10 = '<c:out value="${list[3].firstimageurl}"/>';
            var img11 = '<c:out value="${list[3].secondimageurl}"/>';
            var img12 = '<c:out value="${list[3].thirdimageurl}"/>';
            </script>
			<c:forEach items="${list}" var="board" varStatus="theCount">
            <div class="list">
                <div class="camplist">
                    <div id="list_image${theCount.count}" style="background-image: url(${board.firstimageurl});">
                        <input type="image" class="leftbtn${theCount.count}" src="${path}/resources/image/left.png">
                        <input type="image" class="rightbtn${theCount.count}" src="${path}/resources/image/right.png">
                        <img src="${path}/resources//image/location.png"><span class="location">${board.addr1}</span>
                    </div>

                    <a href="/board/get?campnum=${board.campnum}&&startDate=<fmt:formatDate value="${setdate.startDate}" pattern="yyyy-MM-dd"/>&&endDate=<fmt:formatDate value="${setdate.endDate}" pattern="yyyy-MM-dd"/>">
                        <div class="info">
                            <p class="category">${board.induty}</p>
                            <p class="campname">${board.facltnm}</p>
                            <p class="intro">${board.lineintro}</p>
                            <div class="info_hashtag">
                                <div class="hashtag">#자연친화</div>
                                <div class="hashtag">#물놀이가능</div>
                                <div class="hashtag">#가족캠핑</div>
                                <div class="hashtag">#반려동물</div>
                            </div>

                            <p class="able">예약가능 수 : <span style="color: #767676;">해당업체 별도문의</span></p>
                            <p class="price"><fmt:formatNumber value="${board.price}" pattern="#,###"/>원~</p>
                        </div>
                    </a>
                </div>
            </div>
      <script>
    // 왼쪽 버튼 이미지 클릭 시 동작
    window.addEventListener("load", function(event) {
      var leftBtn = document.querySelector(".leftbtn1");
      var arrImg = [img1, img2, img3];
      var cntleft = 1;
      leftBtn.onclick = function () {
        var mainImg = document.querySelector("#list_image1");
        if (cntleft >= arrImg.length) {
          cntleft = 0;
        }
        cntleft++;
        mainImg.style.backgroundImage = "url(" + arrImg[cntleft - 1] + ")";
      }
    });

    // 오른 쪽 버튼 이미지 클릭 시 동작
    window.addEventListener("load", function(event) {
      var rightBtn = document.querySelector(".rightbtn1");
      var arrImg = [img1, img2, img3];
      var cntright = arrImg.length;
      rightBtn.onclick = function () {
        var mainImg = document.querySelector("#list_image1");
        cntright--;
        if (cntright < 0) {
          cntright = arrImg.length - 1;
        }
        mainImg.style.backgroundImage = "url(" + arrImg[cntright] + ")";
      }
    });
    // 왼쪽 버튼 이미지 클릭 시 동작
    window.addEventListener("load", function(event) {
      var leftBtn = document.querySelector(".leftbtn2");
      var arrImg = [img4, img5, img6];
      var cntleft = 1;
      leftBtn.onclick = function () {
        var mainImg = document.querySelector("#list_image2");
        if (cntleft >= arrImg.length) {
          cntleft = 0;
        }
        cntleft++;
        mainImg.style.backgroundImage = "url(" + arrImg[cntleft - 1] + ")";
      }
    });

    // 오른 쪽 버튼 이미지 클릭 시 동작
    window.addEventListener("load", function(event) {
      var rightBtn = document.querySelector(".rightbtn2");
      var arrImg = [img4, img5, img6];
      var cntright = arrImg.length;
      rightBtn.onclick = function () {
        var mainImg = document.querySelector("#list_image2");
        cntright--;
        if (cntright < 0) {
          cntright = arrImg.length - 1;
        }
        mainImg.style.backgroundImage = "url(" + arrImg[cntright] + ")";
      }
    });
    
    // 왼쪽 버튼 이미지 클릭 시 동작
    window.addEventListener("load", function(event) {
      var leftBtn = document.querySelector(".leftbtn3");
      var arrImg = [img7, img8, img9];
      var cntleft = 1;
      leftBtn.onclick = function () {
        var mainImg = document.querySelector("#list_image3");
        if (cntleft >= arrImg.length) {
          cntleft = 0;
        }
        cntleft++;
        mainImg.style.backgroundImage = "url(" + arrImg[cntleft - 1] + ")";
      }
    });

    // 오른 쪽 버튼 이미지 클릭 시 동작
    window.addEventListener("load", function(event) {
      var rightBtn = document.querySelector(".rightbtn3");
      var arrImg = [img7, img8, img9];
      var cntright = arrImg.length;
      rightBtn.onclick = function () {
        var mainImg = document.querySelector("#list_image3");
        cntright--;
        if (cntright < 0) {
          cntright = arrImg.length - 1;
        }
        mainImg.style.backgroundImage = "url(" + arrImg[cntright] + ")";
      }
    });
    
    // 왼쪽 버튼 이미지 클릭 시 동작
    window.addEventListener("load", function(event) {
      var leftBtn = document.querySelector(".leftbtn4");
      var arrImg = [img10, img11, img12];
      var cntleft = 1;
      leftBtn.onclick = function () {
        var mainImg = document.querySelector("#list_image4");
        if (cntleft >= arrImg.length) {
          cntleft = 0;
        }
        cntleft++;
        mainImg.style.backgroundImage = "url(" + arrImg[cntleft - 1] + ")";
      }
    });

    // 오른 쪽 버튼 이미지 클릭 시 동작
    window.addEventListener("load", function(event) {
      var rightBtn = document.querySelector(".rightbtn4");
      var arrImg = [img10, img11, img12];
      var cntright = arrImg.length;
      rightBtn.onclick = function () {
        var mainImg = document.querySelector("#list_image4");
        cntright--;
        if (cntright < 0) {
          cntright = arrImg.length - 1;
        }
        mainImg.style.backgroundImage = "url(" + arrImg[cntright] + ")";
      }
    });
  </script>
            </c:forEach>
            <c:if test="${empty list}">
			<div class="nolist">
              <img src="${path}/resources/image/nolist.png">
            </div>
			</c:if>
            

            <!-----------------리스트 페이지 끝----------------->

            <!-----------------페이징 시작----------------->

            <div class="paging">
               					<ul>
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}"><img src="${path}/resources/image/pageleft.png" class="page"></a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }"><img src="${path}/resources/image/pageright.png" class="page"></a></li>
						</c:if>
					</ul>
            </div>


            <!-----------------페이징 끝----------------->

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
                        <span style="font-weight: bold;">야캠핑어때 주식회사</span> | 소재지 : 경기 수원시 영통구 영통로217번길 6 3층 | 사업자번호
                        :
                        752-80-1234 |
                        고객센터 : 070-123-4567 | 메일 : yacamping@email.com
                    </div>
                    <div class="copyright">Copyright 야캠핑어때 COMMUNICATION. All rights reserved.</div>
                </div>
            </footer>
            <!-----------------푸터 끝----------------->
            <form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
				<input type='hidden' name='startDate' value='<fmt:formatDate value="${pageMaker.cri.startDate }" pattern="yyyy-MM-dd"/>'>
				<input type='hidden' name='endDate' value='<fmt:formatDate value="${pageMaker.cri.endDate }" pattern="yyyy-MM-dd"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
				<input type='hidden' name='category' value='<c:out value="${ pageMaker.cri.category }"/>'>
			</form>
      </div>
    </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var result = '<c:out value="${result}"/>';

						check(result);

						history.replaceState({}, null, null);

						function check(result) {

							if (result === '' || history.state) {
								return;
							}
						}	
					
						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move")
								.on(
										"click",
										function(e) {

											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='campnum' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/board/get");
											actionForm.submit();

										});
					});

</script>
</body>

</html>