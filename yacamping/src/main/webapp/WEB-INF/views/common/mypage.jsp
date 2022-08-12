<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
  <title>야캠핑어때 마이페이지</title>
  <link href="resources/css/mypage.css" rel="stylesheet" />
  <script src="resources/js/jquery-3.6.0.min.js"></script>
  <script>
  function disablesubmit() {
	  	$("#modify_btn1").attr("disabled", false);
	  	$("#modify_btn2").attr("disabled", false);
	  	$("#modify_btn3").attr("disabled", false);
		$("#modify_btn4").attr("disabled", false);
		$("#modify_btn5").attr("disabled", false);
	}
  </script>
</head>

<body>
  <div class="container">
    <div class="allcontent">
      <!-----------------헤더 시작----------------->
      <header>

        <div class="head">
          <!--로고이미지&타이틀-->
          <a href="/"><img src="resources/image/logo-1.png" class="logo" alt="로고">
          <div class="logotitle">야캠핑어때</div></a>

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

      <!-----------------프로필 시작----------------->
      <div class="private">
        <div class="user">
          <img src="resources/image/user-private.png" class="person">
          <c:choose>
          <c:when test="${not empty sessionScope.nickname }" >
          <div class="txt">
            <p class="hi">안녕하세요! ${sessionScope.nickname}님<br></p>
            <p>야캠핑어때와 즐거운 여행되세요</p>
          </div>
          </c:when>
          <c:otherwise>
          <div class="txt">
            <p class="hi">안녕하세요! ${member.nickname }님<br></p>
            <p>야캠핑어때와 즐거운 여행되세요</p>
          </div>
          </c:otherwise>
          </c:choose>
        </div>
      </div>

      <!-----------------프로필 끝----------------->
	
      <!-----------------개인정보 시작----------------->
		
      <div class="profile_reservationlist">
        <div class="alltabMenu">

		
          <input type="radio" id="tab1" name="tabs" checked>
          <label for="tab1">개인정보</label>
          <input type="radio" id="tab2" name="tabs">
          <label for="tab2">예약목록</label>
          
          <!--탭 메뉴의 내용부분-->
          <div id="profile" class="tabContent">
		  <c:choose>
		  	<c:when test="${not empty sessionScope.nickname }">
		  	카카오 회원 페이지
		  		<div class="id">
	              <p>아이디</p><input class="empty" type='text' name="id" value="${sessionScope.id}" disabled />
	            </div>
	            <div class="nick">
	              <p>닉네임</p><input id='modify_btn2' name="nickname" type='text' value="${sessionScope.nickname}" disabled />
	            </div>
	            <div class="birth">
	              <p>생년월일</p><input class='empty' type='text' value="${sessionScope.birthday }" disabled />
	            </div>
	          	<c:if test="${sessionScope.gender eq 'male'}">
	            <div class="gender">
	              <p>성별</p><input class='empty' type='text' value="남" disabled />
	            </div>
	          	</c:if>
	         	<c:if test="${sessionScope.gender eq 'female'}">
	            <div class="gender">
	              <p>성별</p><input class='empty' type='text' value="여" disabled />
	            </div>
	          	</c:if>
		  	</c:when>
		  	<c:otherwise>
		  	<form action="/update" method="post" onsubmit="disablesubmit()">
	            <div class="id">
	              <p>아이디</p><input class="empty" type='text' name="id" value="${member.id }" disabled />
	            </div>
	
	            <div class="pw">
	              <p>비밀번호</p><input id='modify_btn1' type='password' name="password" value="${member.password }"  disabled />
	              <button type="button" onclick='btnActive1()'><img src="resources/image/setting.png">수정</button>
	            </div>
	
	            <div class="name">
	              <p>이름</p><input class='empty' type='text' value="${member.name }" disabled />
	            </div>
	
	            <div class="nick">
	              <p>닉네임</p><input id='modify_btn2' name="nickname" type='text' value="${member.nickname }" disabled />
	              <button type="button" onclick='btnActive2()'><img src="resources/image/setting.png">수정</button>
	            </div>
				<fmt:parseDate var="dateString" value="${member.birth}" pattern="yyyy-MM-dd" />
	            <div class="birth">
	              <p>생년월일</p><input class='empty' type='text' value="<fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd"/>" disabled />
	            </div>
	            <div class="gender">
	              <p>성별</p><input class='empty' type='text' value="${member.gender }" disabled />
	            </div>
	            <div class="phone">
	              <p>전화번호</p><input id='modify_btn3' type='text' name='phone' value="${member.phone }" disabled />
	              <button type="button" onclick='btnActive3()'><img src="resources/image/setting.png">수정</button>
	            </div>
	            <div class="mail">
	              <p>이메일</p><input id='modify_btn4' type='text' name='email' value="${member.email }" disabled />
	              <button type="button" onclick='btnActive4()'><img src="resources/image/setting.png">수정</button>
	            </div>
	            <div class="add">
	              <p>주소</p><input id='modify_btn5' type='text' name='address' value="${member.address }" disabled />
	              <button type="button" onclick='btnActive5()'><img src="resources/image/setting.png">수정</button>
	            </div>
	            <input class="empty" type='text' name="id" value="${member.id }" style="display:none"/>
	
	            <div class="btn">
	              <button class="submit"><p>수정한 내용 저장하기</p></button>
	     	      <a href="/memberDelete" onclick="window.open(this.href, '_blank', 'width=400px, height=500px'); return false;"><button type="button" class="exit"><p>회원탈퇴하기</p></button></a>
	            </div>
	            </form>
		  	</c:otherwise>
		  </c:choose>
	      </div>
          
 
          
          
          
          <!-----------------개인정보 끝----------------->


          <!-----------------예약정보 시작----------------->

          <div id="list" class="tabContent">
            <ul>
              <li>예약번호</li>
              <li>캠핑장이름</li>
              <li>어른인원</li>
              <li>아동인원</li>
              <li>가격</li>
              <li>예약한날</li>
              <li>체크인</li>
              <li>체크아웃</li>
            </ul>
			<c:forEach items="${list}" var="booking">
            <ul class="camplist">
              <li>${booking.reservid }</li>
              <li>${booking.facltnm }</li>
              <li>${booking.audult_no }명</li>
              <li>${booking.child_no }명</li>
              <li><fmt:formatNumber value="${booking.price}" pattern="#,###"/>원</li>
              <li><fmt:formatDate value="${booking.reservday}" pattern="yyyy-MM-dd"/></li>
              <li>${booking.checkin }</li>
              <li>${booking.checkout }</li>
            </ul>
			</c:forEach>
			<c:forEach items="${kakao}" var="kakaobooking">
			<ul class="camplist">
              <li>${kakaobooking.reservid }</li>
              <li>${kakaobooking.facltnm }</li>
              <li>${kakaobooking.audult_no }명</li>
              <li>${kakaobooking.child_no }명</li>
              <li><fmt:formatNumber value="${kakaobooking.price}" pattern="#,###"/>원</li>
              <li><fmt:formatDate value="${kakaobooking.reservday}" pattern="yyyy-MM-dd"/></li>
              <li>${kakaobooking.checkin }</li>
              <li>${kakaobooking.checkout }</li>
            </ul>
			</c:forEach>
          </div>
        </div>
      </div>

      <!-----------------예약내역 끝----------------->



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
            <span style="font-weight: bold;">야캠핑어때 주식회사</span> | 소재지 : 경기 수원시 영통구 영통로217번길 6 3층 | 사업자번호 : 752-80-1234
            |
            고객센터 : 070-123-4567 | 메일 : yacamping@email.com
          </div>
          <div class="copyright">Copyright 야캠핑어때 COMMUNICATION. All rights reserved.</div>
        </div>
      </footer>
      <!-----------------푸터 끝----------------->


    </div>
  </div>
  <script src="resources/js/mypage.js"></script>

</body>

</html>