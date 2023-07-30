<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>login_ok</title>
	<%@ include file="../views/common/navbar.jsp" %>
</head>
<%--a87543beac34ad8d2b278a24584916c9 카카오 key--%>

<style>
	.img-circle {
		width: 250px;
	}
</style>

<body>
<%-- -------------------------------------------------------------------------- --%>
<section>
	<!-- -------------------------------------------------------------------------- -->

	<div class="container-fluid well span6" style="box-shadow: 0 0 15px 9px #00000096; width: 50%; height: 70%; margin-top: 25px; padding: 70px">
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