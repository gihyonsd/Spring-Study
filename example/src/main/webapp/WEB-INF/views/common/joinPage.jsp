<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   #joinformArea{
      width : 400px;
      margin : auto;
      border : 1px solid gray;
   }
   table{
      width : 380px;
      margin :  auto;
      text-align: center;
   }
</style>
</head>
<body>
<section id = "joinformArea">
<form name="joinform" action="/register" method="post">
<table>
   <tr>
      <td colspan="2">
         <h1>회원가입 페이지</h1>
      </td>
   </tr>
   <tr>
      <td><label for = "id">아이디 : </label> </td>
      <td><input type="text" name="id" id = "id"/></td>
   </tr>
   <tr>
      <td><label for = "password">비밀번호 : </label></td>
      <td><input type="password" name="password" id = "password"/></td>
   </tr>
   <tr>
      <td><label for = "name">이름 : </label></td>
      <td><input type="text" name="name" id = "name"/></td>
   </tr>
   <tr>
      <td><label for = "nickname">닉네임 : </label></td>
      <td><input type="text" name="nickname" id = "nickname"/></td>
   </tr>
   <tr>
      <td><label for = "phone">전화번호 : </label></td>
      <td><input type="text" name="phone" id = "phone"/></td>
   </tr>
   <tr>
      <td><label for = "birth">생년월일 : </label></td>
      <td><input type="text" name="birth"  id = "birth"/></td>
   </tr>
   <tr>
      <td><label for = "email">이메일 : </label></td>
      <td><input type="text" name="email" id = "email"/></td>
   </tr>
   <tr>
      <td><label for = "address">주소 : </label></td>
      <td><input type="text" name="address" id = "address"/></td>
   </tr>
   <tr>
      <td><label for = "gender">성별 : </label></td>
      <td>
         <input type="radio" name="gender" value="남" checked="checked" id = "gender"/>남자
         <input type="radio" name="gender" value="여"/>여자
      </td>
   </tr>
   <tr>
      <td colspan="2">
         <a href="javascript:joinform.submit()">회원가입</a>&nbsp;&nbsp;
         <a href="javascript:joinform.reset()">다시작성</a>
      </td>
   </tr>
</table>
</form>
</section>
</body>
</html>