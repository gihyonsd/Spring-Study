<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/board/booking?bno=<c:out value="${board.bno}"/>" method="post">
<c:out value="${board.bno}"/>
<c:out value="${board.faclt_nm}"/><br>
<c:out value="${board.tel}"/>
<input type="submit" value="예약하기">
</form>
</body>
</html>