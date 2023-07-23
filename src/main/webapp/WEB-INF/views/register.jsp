<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="write">
		<p>아이디 <input type="text" name="id" size="15"></p>
		<p>비번 <input type="password" name="pwd" size="15"></p>
		<p>닉네임 <input type="text" name="nickname" size="15"></p>
		<p>전화번호 <input type="text" name="tel" size="20"></p>
		<p>이미지 <input type="text" name="imgPath" size="20"></p>
		<p><input type="submit" value="회원가입"> <input type="reset" value="리셋">
		&nbsp;<input type="button" value="로그인창" onclick="location.href='login'"></p>
	</form>
</body>
</html>