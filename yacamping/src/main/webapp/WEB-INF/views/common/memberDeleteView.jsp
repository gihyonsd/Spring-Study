<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<title>회원탈퇴</title>
<link type="text/css" rel="stylesheet" href="resources/css/memberDeleteView.css">
</head>
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".canclebtn").on("click", function(){
				self.close();  
			})
		
			$("#submit").on("click", function(){
				if($("#password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
				$.ajax({
					url : "/passChk",
					type : "POST",
					dataType : "json",
					data : $("#delForm").serializeArray(),
					success: function(data){
						
						if(data==0){
							alert("패스워드가 틀렸습니다.");
							return;
						}else{
							if(confirm("회원탈퇴하시겠습니까?")){
								$("#delForm").submit();
							}
						}
					}
				})
				
			});
			
				
			
		})
	</script>
<body>
  <div class="memberexit">

    <h2>회원 탈퇴</h2>

    <form action="/memberDelte" method="post" id="/delForm">

      <div class="enter">
        <label for="id">아이디</label>
        <input type="text" id="id" name="id" value="${id}" readonly="readonly" />
      </div>

      <div class="enter">
        <label for="password">패스워드</label>
        <input type="password" id="password" name="password" />
      </div>



    </form>

    <div class="btn">
      <button id="submit" class="exitbtn">회원탈퇴</button>
      <button type="button" class="canclebtn">탈퇴취소</button>
    </div>

    <img src="resources/image/exit.jpg">


  </div>

</body>

</html>