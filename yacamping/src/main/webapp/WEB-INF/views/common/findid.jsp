<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>야캠핑어때 비밀번호 찾기</title>
  <link type="text/css" rel="stylesheet" href="resources/css/findpassword.css">
  <style>
  .idimg {
	position: fixed;
	top:225px;
}	
  </style>
</head>

<body>
  <div class="findform">
    <h2>아이디 찾기</h2>
    <form method="post" action="/findid">

      <div class="enter">
        <label for="name">이름</label>
        <input type="text" id="name" name="name" placeholder="ex)홍길동">
      </div>

      <div class="enter">
        <label for="email">이메일</label>
        <input type="text" id="email" name="email" placeholder="ex)camping@mail.com">
      </div>

	  <c:if test="${empty check}">
	   <div>
        <input type="submit" value="찾기" class="find">
      </div>
	  </c:if>

      <!-- 정보가 일치하지 않을 때-->
      <c:if test="${check == 1}">
        <script>
          opener.document.findform.id.value = "";
          opener.document.findform.name.value = "";
          opener.document.findform.email.value = "";
        </script>
        <label class="answer1">일치하는 정보가 존재하지 않습니다.</label>
       <div>
        <input type="submit" value="찾기" class="find">
      </div>
      </c:if>

      <!-- 이름과 비밀번호가 일치하지 않을 때 -->
      <c:if test="${check == 0 }">
        <div class="answer2">
          <label>찾으시는 아이디는' ${id}' 입니다.</label>
          <input type="button" value="확인" class="ok" onclick="closethewindow()">
        </div>
      </c:if>
    </form>
    <img src="resources/image/idpw.jpg" class="idimg">
  </div>

  <script type="text/javascript">
    function closethewindow() {
      self.close();
    }
  </script>
</body>

</html>