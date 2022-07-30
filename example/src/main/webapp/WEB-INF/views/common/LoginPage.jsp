<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Noto Sans KR", sans-serif;
}

a {
	text-decoration: none;
	color: black;
}

.wrap {
	width: 100%;
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background: rgba(0, 0, 0, 0.1);
}

.login {
	width: 450px;
	height: 600px;
	background: white;
	border-radius: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

h2 {
	color: #7DB249;
	font-size: 2em;
	text-shadow: 0.5px 0.5px 0.5px gray;
}

.login_id {
	margin-top: 20px;
	width: 360px;
}

.login_id input {
	width: 100%;
	height: 50px;
	margin-top: 15px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
	background-color: #F2F2F2;
}

.login_pw input {
	width: 360px;
	height: 50px;
	margin-top: 15px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
	background-color: #F2F2F2;
}

.login_etc {
	padding: 10px;
	width: 360px;
	font-size: 13px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-weight: bold;
}

.checkbox input {
	accent-color: #7DB249;
}

.message {
	position: relative;
	top: 30px;
	font-size: 14px;
}

.message a {
	color: #7DB249;
	font-weight: bold;
}

.submit input {
	width: 360px;
	height: 35px;
	margin-top: 50px;
	border: 0;
	outline: none;
	background: #7DB249;
	color: white;
	font-size: 0.9em;
	font-weight: bold;
	letter-spacing: 2px;
}

.line {
	margin: 15px;
	text-align: center;
	font-size: 12px;
	color: rgba(0, 0, 0, 0.35);
}

.line::before {
	display: inline-block;
	margin: 0 10px 3px 0;
	height: 1px;
	content: " ";
	text-shadow: none;
	background-color: rgba(0, 0, 0, 0.35);
	width: 115px;
}

.line::after {
	display: inline-block;
	margin: 0 0 3px 10px;
	height: 1px;
	content: " ";
	text-shadow: none;
	background-color: rgba(0, 0, 0, 0.35);
	width: 115px;
}

.sns_login input {
	width: 360px;
	height: 35px;
	margin-top: 5px;
	border: 0;
	outline: none;
	margin-right: 30px;
}

.kakao {
	background-color: #FEE500;
	color: #181600;
	font-size: 0.9em;
	font-weight: bold;
}

.kakao_login img, .naver_login img {
	width: 30px;
	height: 30px;
	position: relative;
	left: 40px;
	top: 10px;
}

.naver {
	background-color: #03C75A;
	color: #FFFFFF;
	font-size: 0.9em;
	font-weight: bold;
}
</style>
</head>
<body>
<body>
	<section id="loginFormArea">
		<form action="/Login" method="post">
			<div class="wrap">

				<div class="login">

					<img src="resources/image/logo.png">
					<h2>야캠핑어때</h2>

					<div class="login_id">
						<input type="text" name="id" id="id" value="${cookie.id.value}" placeholder="ID">
					</div>

					<div class="login_pw">
						<input type="password" name="password" id="password"
							placeholder="Password">
					</div>

					<div class="login_etc">
						<div class="checkbox">
							<input type="checkbox" ${empty cookie.id.value ? "":"checked" } name="rememberId"> 아이디 저장하기
						</div>

						<div class="forgot_id_pw">
							<a href="">아이디/비밀번호 찾기</a>
						</div>

					</div>

					<p class="message">
						아직 회원이 아니신가요? <a href="/register">회원가입</a>
					</p>

					<div class="submit">
						<input type="submit" value="로그인">
					</div>

					<div class="line">SNS로 로그인하기</div>

					<div class="sns_login">
						<div class="kakao_login">
							<img src="resources/image/kakao.jpg"><input type="submit"
								value="카카오 로그인" class="kakao">
						</div>
						<div class="naver_login">
							<img src="resources/image/naver.png"><input type="submit"
								value="네이버 로그인" class="naver">
						</div>
					</div>

				</div>
			</div>
		</form>
	</section>
</body>
</html>