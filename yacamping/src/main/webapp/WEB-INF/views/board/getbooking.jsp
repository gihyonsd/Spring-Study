<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var = "path" value = "${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>야캠핑어때 예약하기</title>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="${path}/resources/js/booking.js"></script>
  <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <link type="text/css" rel="stylesheet" href="${path}/resources/css/booking.css">
</head>


<body>
<fmt:parseNumber value="${setdate.startDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
<fmt:parseNumber value="${setdate.endDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
 <form action="/board/booking?campnum=${board.campnum}&&startDate=<fmt:formatDate value="${setdate.startDate}" pattern="yyyy-MM-dd"/>&&endDate=<fmt:formatDate value="${setdate.endDate}" pattern="yyyy-MM-dd"/>" name="booking" method="post">
  <div class="wrap">
    <div class="container">

      <!------------------예약내용 시작------------------>


      <div class="reservation">
        <img src="${board.firstimageurl }">
        <div class="txt">
          <div class="name">${board.facltnm }</div>
          <div class="add">${board.addr1 }</div>
        </div>
      </div>

      <!------------------예약내용 끝------------------>

      <!------------------인원 시작------------------>

      <div class="box1">

        <div class="person">
          <p class="division">어 른</p>
          <div class="count">
            <button id="down">-</button>
            <input type="text" id="number" name="audult_no" value="1">
            <button id="up">+</button>
          </div>
        </div>

        <div class="person">
          <p class="division">아 동</p>
          <div class="count">
            <button id="down1">-</button>
            <input type="text" id="number1" name="child_no" value="1">
            <button id="up1">+</button>
          </div>
        </div>
      </div>

      <!------------------인원 끝------------------>

      <!------------------체크인아웃 시작------------------>

      <div class="box">

        <dlv class="inout">

          <div class="checkcontent">
            <div class="check">체크인</div>
            <div class="date"><fmt:formatDate value="${setdate.startDate}" pattern="yyyy년MM월dd일(E)"/></div>
          </div>

          <div class="day">${endDate - strDate}박</div>

          <div class="checkcontent">
            <div class="check">체크아웃</div>
            <div class="date"><fmt:formatDate value="${setdate.endDate}" pattern="yyyy년MM월dd일(E)"/></div>
          </div>

        </dlv>

      </div>
	
      <!------------------체크인아웃 끝------------------>

      <!------------------결제 금액 시작------------------>

      <div class="pay">
        <div class="total">결제 금액</div>
        <div class="won"><fmt:formatNumber value="${board.price * (endDate - strDate)}" pattern="#,###"/><span style="font-size: 13px; margin-left: 3px; font-weight: normal;">원</span></div>
      </div>
	</form>
      <!------------------결제 금액 끝------------------>
	  <input type="hidden" name="totalprice" value="<c:out value="${board.price}" />">
	  <input type="hidden" name="kakao_id" value="${sessionScope.id }"/>
      
	  
	  <!------------------결제하기 버튼 시작------------------>
      <div class="nextbtn">
        <button id="check_module" type="button">결제하기</button>
      </div>

      <!------------------결제하기 버튼 끝------------------>

    </div>
  </div>
  <script>
	var form = document.booking;
	$("#check_module").click(function () {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp12102116'); 
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
		IMP.request_pay({
			pg: 'html5_inicis',
			pay_method: 'card',
			merchant_uid: 'orderid' + new Date().getTime(),
			/* 
			 *  merchant_uid에 경우 
			 *  https://docs.iamport.kr/implementation/payment
			 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 */
			name: '${board.facltnm}',
			// 결제창에서 보여질 이름
			// name: '주문명 : ${auction.a_title}',
			// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
			amount: '${board.price * (endDate - strDate)}',
			// 가격 
			buyer_name: '이름',
			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
			buyer_postcode: '123-456',
			}, function (rsp) {
				console.log(rsp);
			if (rsp.success) {
				var msg = '(주)야 캠핑 어때' + "\n" + '결제가 완료되었습니다.' + "\n";
				msg += '캠핑장 이름: ' + rsp.name + "\n";
				msg += '결제 금액 : ' + rsp.paid_amount;
				form.submit();
				alert(msg);
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
				location.href = document.referrer;
			}
		});
	});
</script>
</body>

</html>