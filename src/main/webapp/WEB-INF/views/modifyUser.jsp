<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>login_ok</title>
	<%@ include file="../views/common/navbar.jsp" %>
</head>
<%--a87543beac34ad8d2b278a24584916c9 카카오 key--%>
<link href="../../resources/css/user.css" rel="stylesheet">

<body>
<%-- -------------------------------------------------------------------------- --%>
<section>
	<!-- -------------------------------------------------------------------------- -->

	<div class="white-panel" style="position: inherit; margin: auto; width: 40%">
		<div class="login-show">
			<h2>회원정보</h2>
			<form id="registerForm">
				<input type="text" id="nickname" name="nickname" value="${userDto.nickname}" placeholder="닉네임" required>
				<input id="duplicateCheck" style="margin-bottom: 5px; margin-top: -15px" type="button" value="중복체크">
				<input name="pwd" type="password" id="pwd" placeholder="비밀번호" required>
				<input name="pwd2" type="password" id="pwd2" placeholder="비밀번호 확인" required>
				<label for="pwd2"></label>
				<input id="registerCheck" style="background-color: #bbbbbb" type="button" value="변경" disabled>
			</form>
		</div>
	</div>

	<!-- -------------------------------------------------------------------------- -->
</section>
<%@ include file="../views/common/footer.jsp" %>
</body>
<script>

	$(document).ready(function(){
		$('.login-info-box').fadeOut();
		$('.login-show').addClass('show-log-panel');
	});

	/*
        $("#registerCheck").click(function(){

            var formData = $("#registerForm").serialize();

            $.ajax({
                type: "POST"
                ,data: formData
                ,url: "URL"
                ,success: function(data, status){
                    if (data === 200) {
                        location.href = "/login_ok";
                    } else {
                        Swal.fire({
                            icon: 'warning',
                            title: '로그인 실패',
                            text: "존재하지 않는 아이디입니다",
                            showCancelButton: false,
                            confirmButtonText: '확인'
                        })
                    }
                }
                ,error: function(){
                    Swal.fire({
                        icon: 'warning',
                        title: '실패',
                        text: "서버 문제입니다",
                        showCancelButton: false,
                        confirmButtonText: '확인'
                    })
                }
            })
        });
    */
</script>
</html>