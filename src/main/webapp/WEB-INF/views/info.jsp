<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>info</title>
	<%@ include file="../views/common/navbar.jsp" %>
</head>
<%--a87543beac34ad8d2b278a24584916c9 카카오 key--%>
<link href="../../resources/css/user.css" rel="stylesheet">

<style>
	.img-circle {
		width: 250px;
	}
</style>

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
			<h2>프로필 수정은 이쪽입니다!</h2>
			<label id="label-login" for="log-login-show">프로필 수정</label>
			<input type="radio" name="active-log-panel" id="log-login-show">
		</div>

		<div class="white-panel">
			<div class="login-show" style="opacity: 1.0;">
				<div class="container-fluid well span6" style="box-shadow: 0 0 15px 9px #00000096; margin-top: 25px; padding: 70px">
					<div class="row-fluid">
						<div class="span2" >
							<c:choose>
								<c:when test="${userDto.imgPath == null}">
									<img src="../../resources/imgs/userDefaultIcon.png" class="img-circle">
								</c:when>
								<c:otherwise>
									<img src="${userDto.imgPath}" class="img-circle">
								</c:otherwise>
							</c:choose>

						</div>

						<div class="span8">
							<h3>ID : ${userDto.nickname}</h3>
							<h6>${userDto.id}</h6>
							<h6>tel : ${userDto.tel}</h6>
							<h6><a href="#">More... </a></h6>
						</div>

						<div class="span2">
							<div class="btn-group">
								<a class="btn dropdown-toggle btn-info" data-toggle="dropdown" href="#">
									Action
									<span class="icon-cog icon-white"></span><span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li><a href="#"><span class="icon-wrench"></span> Modify</a></li>
									<li><a href="#"><span class="icon-trash"></span> Delete</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
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