<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<head>
	<title>login</title>
	<%@ include file="../views/common/navbar.jsp" %>
</head>
<%--a87543beac34ad8d2b278a24584916c9 카카오 key--%>
<link href="../../resources/css/user.css" rel="stylesheet">

<body>
<%-- -------------------------------------------------------------------------- --%>
<section>
	<!-- -------------------------------------------------------------------------- -->
	<div class="login-reg-panel">
		<div class="login-info-box">
			<h2>계정이 있으신가요?</h2>
			<p>로그인 해주세요!</p>
			<label id="label-register" for="log-reg-show">로그인</label>
			<input type="radio" name="active-log-panel" id="log-reg-show"  checked="checked">
		</div>

		<div class="register-info-box">
			<h2>계정이 없으신가요?</h2>
			<p>지금 가입해 보세요!</p>
			<label id="label-login" for="log-login-show">회원가입</label>
			<input type="radio" name="active-log-panel" id="log-login-show">
		</div>

		<div class="white-panel">
			<div class="login-show">
				<h2>로그인</h2>
				<form id="loginForm">
					<input type="text" name="id" placeholder="아이디" required>
					<input type="password" name="pwd" placeholder="비밀번호" required>
					<input id="loginCheck" type="button" value="로그인">
				</form>
<%--				<a href="">Forgot password?</a>--%>
			</div>
			<div class="register-show">
				<h2>회원가입</h2>
				<form id="registerForm">
					<input type="text" id="floatingEmail" name="id" placeholder="아이디" required>
					<input id="duplicateCheck" style="margin-bottom: 5px; margin-top: -15px" type="button" value="중복체크">
					<input name="pwd" type="password" id="pwd" placeholder="비밀번호" required>
					<input name="pwd2" type="password" id="pwd2" placeholder="비밀번호 확인" required>
					<label for="pwd2"></label>
					<input id="registerCheck" style="background-color: #bbbbbb" type="button" value="회원가입" disabled>
				</form>
			</div>
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

	let notDuplicate = false;
	const formEmail = document.querySelector("#floatingEmail");
	const formPassword = document.querySelector("#pwd");
	const formPassword2 = document.querySelector("#pwd2");
	const registerButton = document.querySelector("#registerCheck");

	$("#pwd").on("keyup" ,function() {
		if ($("#pwd2").val().length > 0 ) {
			if ($(this).val() == $("#pwd2").val() ) {
				$("#pwd2").css("backgroundColor", "white");
				$("#pwd2").next().html("비밀번호가 일치합니다");
				switch(!(floatingEmail.value && formPassword.value && formPassword2.value && notDuplicate)){
					case false : $("#registerCheck").prop("disabled", false); $("#registerCheck").css("background", "#444444"); break;
					case true : $("#registerCheck").prop("disabled", true); $("#registerCheck").css("background", "#bbbbbb"); break;
				}
			} else {
				$("#pwd2").css("backgroundColor", "red");
				$("#pwd2").next().html("비밀번호가 다릅니다.");
				registerButton.disabled = true; $("#registerCheck").css("background", "#bbbbbb");
			}
		}
	})

	$("#pwd2").on("keyup" ,function() {
		if ($(this).val().length > 0 ) {
			if ( $(this).val() == $("#pwd").val() ) {
				$(this).css("backgroundColor", "white");
				$(this).next().html("비밀번호가 일치합니다");
				switch(!(floatingEmail.value && formPassword.value && formPassword2.value && notDuplicate)){
					case false : $("#registerCheck").prop("disabled", false); $("#registerCheck").css("background", "#444444"); break;
					case true : $("#registerCheck").prop("disabled", true); $("#registerCheck").css("background", "#bbbbbb"); break;
				}
			} else {
				$(this).css("backgroundColor", "red");
				$(this).next().html("비밀번호가 다릅니다.");
				registerButton.disabled = true; $("#registerCheck").css("background", "#bbbbbb");
			}
		}
	})

	$('.login-reg-panel input[type="radio"]').on('change', function() {
		if($('#log-login-show').is(':checked')) {
			$('.register-info-box').fadeOut();
			$('.login-info-box').fadeIn();

			$('.white-panel').addClass('right-log');
			$('.register-show').addClass('show-log-panel');
			$('.login-show').removeClass('show-log-panel');

		}
		else if($('#log-reg-show').is(':checked')) {
			$('.register-info-box').fadeIn();
			$('.login-info-box').fadeOut();

			$('.white-panel').removeClass('right-log');

			$('.login-show').addClass('show-log-panel');
			$('.register-show').removeClass('show-log-panel');
		}
	});



	$("#duplicateCheck").click(function() {
		if(floatingEmail.value) {
		var formData = $("#registerForm").serialize();
		$.ajax({
			type: "POST"
			,data: formData
			,url: "duplicateCheck"
			,success: function(data, status){
				if (data === 200) {
					Swal.fire({
						icon: 'success',
						title: '사용 가능',
						text: "사용 가능한 아이디입니다",
						showCancelButton: false,
						confirmButtonText: '확인'
					}).then(function(){
						$("#floatingEmail").prop("readonly", true);
						$("#floatingEmail").css("background", "#bbbbbb");
						notDuplicate = true;
						switch(!(floatingEmail.value && formPassword.value && formPassword2.value && notDuplicate)){
							case false : $("#registerCheck").prop("disabled", false); $("#registerCheck").css("background", "#444444"); break;
							case true : $("#registerCheck").prop("disabled", true); $("#registerCheck").css("background", "#bbbbbb"); break;
						}
					});
				} else {
					Swal.fire({
						icon: 'warning',
						title: '아이디 중복',
						text: "중복되는 아이디 입니다",
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
		}
	})

	$("#registerCheck").click(function(){

		var formData = $("#registerForm").serialize();

		$.ajax({
			type: "POST"
			,data: formData
			,url: "write"
			,success: function(data, status){
				if (data === 200) {
					Swal.fire({
						icon: 'success',
						title: '가입 완료',
						text: "회원가입이 완료되었읍니다",
						showCancelButton: false,
						confirmButtonText: '확인'
						// 인증 성공하면 이메일 계정 입력부분 비활성화 및 색상변경(grey)
					}).then(function(){
						$('#log-reg-show').click();
						$("#registerCheck").prop("disabled", true);
						$("#registerCheck").css("background", "#bbbbbb");
						$("#duplicateCheck").prop("disabled", true);
						$("#duplicateCheck").css("background", "#bbbbbb");
					});
				} else {
					Swal.fire({
						icon: 'warning',
						title: '실패',
						text: "서버 문제입니다",
						showCancelButton: false,
						confirmButtonText: '확인'
					})
				}
			}
		})
	});

	$("#loginCheck").click(function() {
		var formData = $("#loginForm").serialize();

		$.ajax({
			type: "POST"
			,data: formData
			,url: "login_yn"
			,success: function(data, status){
				if (data === 200) {
					var reloading = sessionStorage.getItem("reloading");
					if (reloading) {
						location.href = "/home";
					} else {
						location.href = "/info";
					}
				}else if(data === 404) {
					Swal.fire({
						icon: 'warning',
						title: '로그인 실패',
						text: "비밀번호가 틀렸읍니다",
						showCancelButton: false,
						confirmButtonText: '확인'
					})
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
	})

	function fn_submit() {
		var formData = new FormData();
		var inputFile = $("input[type='file']");
		var files = inputFile[0].files;
		for (var i = 0; i < files.length; i++) {
			console.log(files[i]);
			formData.append("uploadFiles", files[i]);
		}

		$.ajax({
			url: '/uploadAjax',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType:'json',
			success: function(data){
				if(data === "fail"){
					console.log(data);
				}else{
					var formData2 = $("#frm").serialize();
					formData2.append('photoPath', data);
					$.ajax({
						type:"post"
						,data:formData
						,url:"photoWrite"
						,success: function(data) {
							alert("작성완료");
							location.href="photo";
						}
						,error: function() {
							alert("오류발생")
						}
					});
				}
			},
			error: function(data){
				console.log(data);
			}
		}); //$.ajax
	}

/*
	$("#registerCheck").click(function(){

		var formData = $("#registerForm").serialize();

		$.ajax({
			type: "POST"
			,data: formData
			,url: "URL"
			,success: function(data, status){
				if (data === 200) {
					location.href = "/info";
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