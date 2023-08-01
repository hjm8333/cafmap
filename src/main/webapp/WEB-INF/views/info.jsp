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
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	.labels {
		position: absolute;
		left: 52px;
	}
	.register-show input[type="text"], .register-show input[type="password"], .register-show input[type="number"] {
		width: 100%;
		display: block;
		margin: 5px 0;
		padding: 8px;
		border: 1px solid #b5b5b5;
		outline: none;
	}
	div:where(.swal2-container) button:where(.swal2-styled).swal2-cancel {
		font-size: 3em;
	}
</style>

<body>
<%-- -------------------------------------------------------------------------- --%>
<section>
	<!-- -------------------------------------------------------------------------- -->

	<div class="login-reg-panel">
		<div class="login-info-box" style="width: 35%;">
			<h2>프로필 확인은 이쪽입니다!</h2>
			<label style="float: right; margin-right: 45px;" id="label-register" for="log-reg-show">프로필</label>
			<input type="radio" name="active-log-panel" id="log-reg-show"  checked="checked">
		</div>

		<div class="register-info-box" style="width: 35%">
			<h2>프로필 수정은 이쪽입니다!</h2>
			<label id="label-login" for="log-login-show">프로필 수정</label>
			<input type="radio" name="active-log-panel" id="log-login-show">
		</div>

		<div class="white-panel" style="width: 40%; top: -100px;">
			<div class="login-show" style="opacity: 1.0;">
				<div class="container-fluid well span6" style="box-shadow: 0 0 15px 9px #00000096; margin-top: -118px; padding: 70px; min-height: 640px;">
					<div class="row-fluid">
						<div class="span2" style="width: 250px;
													height: 250px;
													border-radius: 70%;
													overflow: hidden;
													margin: -45px auto 80px;">
							<c:choose>
								<c:when test="${userDto.imgPath == null}">
									<img src="../../resources/imgs/userDefaultIcon.png" class="img-circle">
								</c:when>
								<c:otherwise>
									<img src="/display?fileName=${userDto.imgPath}" class="img-circle">
								</c:otherwise>
							</c:choose>

						</div>

						<div class="span8">
							<h3>닉네임 : ${userDto.nickname}</h3>
							<h6>아이디 : ${userDto.id}</h6>
							<c:choose>
								<c:when test="${userDto.tel != null}">
									<h6>tel : ${userDto.tel}</h6>
								</c:when>
								<c:otherwise>
									<h6>tel : 등록해 주세요!</h6>
								</c:otherwise>
							</c:choose>
						</div>

						<div class="span2">
							<div class="btn-group" style="position: absolute;
															top: 500px;
															right: 70px;">
								<button class="btn btn-primary" style="background-color: #b67f5f; border: black;" type="button" onclick="location.href='logout'"><i class="fa-solid fa-right-from-bracket"></i> 로그아웃</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="register-show" style="opacity: 1.0;">
				<div class="container-fluid well span6" style="box-shadow: 0 0 15px 9px #00000096; margin-top: -118px; padding: 70px; min-height: 640px;">
					<div class="row-fluid">
						<div class="span2" style="width: 250px;
													height: 250px;
													border-radius: 70%;
													overflow: hidden;
													margin: -45px auto 20px;">
							<c:choose>
								<c:when test="${userDto.imgPath == null}">
									<img src="../../resources/imgs/userDefaultIcon.png" class="img-circle">
								</c:when>
								<c:otherwise>
									<img src="/display?fileName=${userDto.imgPath}" class="img-circle">
								</c:otherwise>
							</c:choose>

						</div>

						<div class="span8">
							<div style="display: none">
								<input name="imgPath"  id="fileInputTag" type="file" class="form-control" aria-label="file example" required accept="image/*">
								<button id="writeBtn2" type="button" class="btn btn-primary" style="padding: 20px;"><i class="fa-solid fa-check"></i>프로필 사진 업로드</button>
							</div>
							<label for="fileInputTag" class="btn btn-primary"
								   style="background-color: #b67f5f; border-color: black;
							"><i class="fa-solid fa-camera"></i> 사진 수정</label>
							<div class="form-wrapper">
								<form id="modifyForm" action="modify" method="POST">
									<div class="form-floating mb-3">
										<input name="id" type="text" class="form-control" id="floatingId" value="${ userDto.id }" placeholder="umjoonsik" style="color:grey" readonly>
										<label class="labels" for="floatingId" style="bottom: 199px;"><i>*</i>
											아이디</label>
									</div>

									<div class="form-floating mb-3">
										<input name="nickname" type="text" class="form-control" id="floatingNickname" placeholder="동탄엄준식" value="${userDto.nickname}"/>
										<label class="labels" for="floatingNickname" style="bottom: 162px;"><i>*</i>
											닉네임</label>
									</div>

									<div class="form-floating mb-3">
										<input name="tel" type="text" maxlength="13" class="form-control" id="floatingTel" oninput="oninputPhone(this)" placeholder="010-0000-0000" value="${userDto.tel}"/>
										<label class="labels" for="floatingTel" style="bottom: 122px;"><i>*</i>
											전화번호</label>
									</div>

									<div class="my-pwd-input" style="margin-top: -5px;">
										<div class="form-floating mb-3" style="display: inline-block; width: 65%;">
											<input name="pwd" type="password" class="form-control" id="floatingPassword_origin" placeholder="비밀번호">
											<label class="labels" for="floatingPassword" style="bottom: 84px"><i>*</i>
												현재비번</label>
										</div>
										<button id="passwordChange" type="button" class="btn btn-primary" style="background-color: #b67f5f; border-color: black; display: inline-block;"><i class="fa-solid fa-user-lock"></i>
											변경하기</button>
									</div>

									<div class="new-password-input-area" style="display: none;">
										<input type="hidden" name="pwdChanged" value="false">
										<!-- 변경하기 버튼 눌렀을때만 보이는 영역 -->
										<div class="form-floating mb-3" style="margin-top: -5px">
											<input name="newPassword" type="password" class="form-control" id="floatingPassword" placeholder="비밀번호">
											<label class="labels" for="floatingPassword" style="bottom: 45px"><i>*</i>
												새 비번</label>
										</div>

										<div class="form-floating mb-3">
											<input name="newPassword2" type="password" class="form-control" id="floatingPassword2" placeholder="비밀번호 확인">
											<label class="labels" for="floatingPassword2" style="bottom: 6px"><i>*</i>
												비번확인</label>
										</div>
									</div>

								</form>
							</div>

							<div class="modify-footer">
								<hr style="margin: 0 0 5px;">
								<div class="btns">
									<button id="modifyInfo" type="button" class="btn btn-primary" style="background-color: #b67f5f; border-color: black; margin: 10px 0 10px 0;"><i class="fa-solid fa-user-check"></i>
										저장하기</button>
								</div>
								<h1 style="color: grey; font-size: 23px; margin: 0">아니면</h1>
								<a href="#" id="unregister">회원탈퇴</a>
							</div>
						</div>
					</div>
				</div>
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

	function oninputPhone(target) {
		target.value = target.value
		.replace(/[^0-9]/g, '')
		.replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}

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

	$("input[name='imgPath']").change(function() {
		Swal.fire({
			icon : 'question',
			title: '프로필 사진 변경',
			text : '선택하신 사진으로 프로필을 변경하시겠습니까?',
			showCancelButton: true,
			confirmButtonText: '변경',
			cancelButtonText : '취소',
		}).then((result) => {
			if (result.isConfirmed) {

				var formData = new FormData();
				var inputFile = $("input[name='imgPath']");
				files = inputFile[0].files;
				console.log("---------------")
				console.log(files);
				console.log("---------------")

				for (var i = 0; i < files.length; i++) {
					formData.append("uploadFile", files[i]);
				}

				$.ajax({
					url: "uploadProfile"
					,processData: false
					,contentType: false
					,data: formData
					,type: "POST"
					,success: function(result){
						console.log("uploaded");
						console.log(result);

						if(result!=null){
							$.ajax({
								type: "POST"
								,url: "getProfileImgPath"
								,success: function(data){
									console.log(data);
									$(".img-circle").attr("src","/display?fileName="+data);
								}
							})
						}
					}
				})
			}
		})
	})


	// ====================== 비밀번호 변경 버튼 눌렀을 때 처리 ===========================================
	$("#passwordChange").click(function(){
		const target = $(".new-password-input-area");
		if ( target.css("display") === "none" ) {
			$("input[name='pwdChanged']").val("true");
			$(this).html('<i class="fa-solid fa-user-lock"></i> 변경취소');
			target.slideDown();
		} else {
			$("input[name='pwdChanged']").val("false");
			$(this).html('<i class="fa-solid fa-user-lock"></i> 변경하기');
			target.slideUp();
		}
	})

	// ====================== 회원정보 수정 버튼 눌렀을 때 처리 ===========================================
	$("#modifyInfo").click(function(){

		var formData = $("#modifyForm").serialize();

		$.ajax({
			type: "POST"
			,data: formData
			,url: "modify"
			,success: function(data, status){
				Swal.fire({
					icon: 'success',
					title: '수정 성공',
					text: "회원정보 수정을 완료했습니다!",
					showCancelButton: false,
					confirmButtonText: '확인'
				})
						.then(function(){
							location.reload();
						})
			}
			,error : function(data){
				if(data.responseText === "fail") {
					Swal.fire({
						icon: 'warning',
						title: '변경 실패',
						text: "비밀번호를 다시 확인해주세요",
						showCancelButton: false,
						confirmButtonText: '확인'
					})
				} else {
					Swal.fire({
						icon: 'warning',
						title: '변경 실패',
						text: "닉네임 중복입니다!",
						showCancelButton: false,
						confirmButtonText: '확인'
					})
				}
			}
		});
	});

	// ====================== 회원탈퇴 링크 클릭했을 때 처리 ===========================================
	$("#unregister").click(function(){
		Swal.fire({
			icon: 'question' ,
			title: '회원탈퇴' ,
			text: "회원 탈퇴하시겠습니까?" ,
			confirmButtonText: '탈퇴' ,
			showCancelButton: false ,
			showDenyButton: true,
			denyButtonText: '취소'
			// 탈퇴 버튼 클릭하면 탈퇴 처리
		}).then((result) => {
			if(result.isConfirmed) {
				var formData = $("#modifyForm").serialize();
				console.log("@# ====> " + formData);

				$.ajax({
					type: "POST"
					,data: {"id":"${ user.id }"}
					,url: "unregister"
					,success: function(data){
						console.log("success!!!!!")
						//location.href = "/smile/main/list";		// 컨트롤러의 URL 로 이동
						location.href =  urlConverter("main/list");
					}
					, error: function(){
						console.log("error!!!!!")
						location.href = "login";
					}
				})
			} else if(result.isDenied) {
				Swal.fire('회원탈퇴를 취소하였습니다.', '', 'info')
			}
		})
	});


	// ★ 입력된 비밀번호와  재확인에 입력된 내용이 서로 같은지 확인하는 내용들 ==================== >>
	const newPassword1 = $("input[name='newPassword']");
	const newPassword2 = $("input[name='newPassword2']");

	$(newPassword1).on("keyup" ,function() {
		if ($(newPassword1).val().length > 0 ) {
			if ($(this).val() == newPassword2.val() ) {
				$(newPassword1).css("backgroundColor", "white");
				$(newPassword1).next().html("<i>*</i> 새 비번");
				$(newPassword2).css("backgroundColor", "white");
				$(newPassword2).next().html("<i>*</i> 비번확인");
			} else {
				$(newPassword1).css("backgroundColor", "red");
				$(newPassword1).next().html('<i class="fa-solid fa-triangle-exclamation" style="color: #6f8ab8;"></i>* 다름');
			}
		}
	})

	$(newPassword2).on("keyup" ,function() {
		if ($(newPassword2).val().length > 0 ) {
			if ($(this).val() == newPassword1.val() ) {
				$(newPassword1).css("backgroundColor", "white");
				$(newPassword1).next().html("<i>*</i> 새 비번");
				$(newPassword2).css("backgroundColor", "white");
				$(newPassword2).next().html("<i>*</i> 비번확인");
			} else {
				$(newPassword2).css("backgroundColor", "red");
				$(newPassword2).next().html('<i class="fa-solid fa-triangle-exclamation" style="color: #6f8ab8;"></i>* 다름');
			}
		}
	})

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