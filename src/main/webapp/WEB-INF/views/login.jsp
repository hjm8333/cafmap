<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
	<title>login</title>
	<%@ include file="../views/common/navbar.jsp" %>
</head>

<body>
<%-- -------------------------------------------------------------------------- --%>
<section>
	<!-- -------------------------------------------------------------------------- -->
	<div style="display: flex; justify-content: center">
		<form method="post" action="login_yn">
			<p>ID <input type="text" name="id" size="15"></p>
			<p>비번 <input type="password" name="pwd" size="15"></p>
			<p><input type="submit" value="로그인"> <input type="reset" value="리셋">
				&nbsp;<input type="button" value="회원가입" onclick="location.href='register'">
			</p>
		</form>
	</div>
	<!-- -------------------------------------------------------------------------- -->
</section>
<%@ include file="../views/common/footer.jsp" %>
</body>
<script>
	$(document).ready(function() {

	})// ~~ end
</script>
</html>