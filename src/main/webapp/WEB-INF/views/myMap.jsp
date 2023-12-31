<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<head>
	<title>MyCafap</title>
	<%@ include file="../views/common/navbar.jsp" %>
</head>
<style>
	.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Jal_Onuel', dotum, '돋움', sans-serif;line-height: 1.5;}
	.wrap * {padding: 0;margin: 0;}
	.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	.info .title {padding-left: 8px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 21px;font-weight: bold;}
	.info .close {position: absolute;top: 7px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	.info .close:hover {cursor: pointer;}
	.info .body {position: relative;overflow: hidden;}
	.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
	.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	.desc .jibun {color: #888; margin-top: -2px;}
	.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
	.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	.info .link {color: #5085BB;}
		 /*!
          * spStrap font
          */
	@import url("https://fonts.googleapis.com/css2?&family=Roboto:wght@300%3B700&display=swap");
	@import url("https://fonts.googleapis.com/css2?&family=Noto+Sans+KR:wght@300%3B500&display=swap");
	#spStrap[sp-contents],
	#spStrap [sp-contents] { font-family:Jal_Onuel,Noto Sans KR,'Apple SD Gothic Neo', 'arial', 'sans-serif', 'serif', 'Noto Color Emoji', 'Apple Color Emoji', 'Segoe UI Emoji'; }
	#spStrap [sp-fontfamily="main"] { font-family:Jal_Onuel, 'Apple SD Gothic Neo', 'arial', 'sans-serif', 'serif', 'Noto Color Emoji', 'Apple Color Emoji', 'Segoe UI Emoji'; }
	#spStrap [sp-fontfamily="sub"] { font-family:Jal_Onuel, 'Apple SD Gothic Neo', 'arial', 'sans-serif', 'serif', 'Noto Color Emoji', 'Apple Color Emoji', 'Segoe UI Emoji'; }

	/*!
     * Mocanvas
     * @license https://www.mocanvas.com
     * @min-width : Samsung Galaxy S, Apple iPhone 5 (5c, 5s)
     */

	/*!
     * Container Buildup
     */
	#spStrap *:not(i) { font-family:Jal_Onuel; }

	[spStrap] { min-width:320px; color:#333; line-height:1.4; position:relative; overflow:hidden; }
	[spStrap], [spStrap] * { -webkit-box-sizing : border-box !important; -khtml-box-sizing : border-box !important; -moz-box-sizing : border-box !important; -ms-box-sizing : border-box !important; -o-box-sizing : border-box !important; box-sizing : border-box !important; }
	[spStrap] [sp-trans],
	[spStrap] [sp-trans]:before,
	[spStrap] [sp-trans]:after {
		-webkit-perspective : 1000; -moz-perspective : 1000; -o-perspective : 1000; perspective : 1000;
		-webkit-backface-visibility : hidden; -khtml-backface-visibility : hidden; -moz-backface-visibility : hidden; -ms-backface-visibility : hidden; -o-backface-visibility : hidden; backface-visibility : hidden;
		-webkit-transition : all 300ms ease; -khtml-transition : all 300ms ease; -moz-transition : all 300ms ease; -ms-transition : all 300ms ease; -o-transition : all 300ms ease; transition : all 300ms ease;
	}

	[spStrap] * { line-height:inherit; }
	[spStrap] [sp-size] { width:1000px; min-width:320px; position:relative; margin-left:auto; margin-right:auto; }
	[spStrap] ol, [spStrap] li, [spStrap] ul { padding:0; margin:0; list-style:none; }
	/*!
     * Element Reset
     */
	[spStrap] a, [spStrap] img, [spStrap] table, [spStrap] div:not([sp-overbox]), [spStrap] span, [spStrap] iframe, [spStrap] ul, [spStrap] li { max-width:100%; }
	[spStrap] [sp-resize] { font-size:0; } [spStrap] [sp-resize] img { width:100%; } [spStrap] div[sp-resize] { margin:0 auto; }
	[spStrap] [sp-resize] { display:inline-block; display:inline-flex; vertical-align:middle; }
	[spStrap] [sp-edit] { position:relative; } [spStrap] span[sp-edit] { display:inline-block; }
	[spStrap] div[sp-edit]:not([sp-line])::after { clear:both; content:' '; display:block; font-size:0; height:0; line-height:0; visibility:hidden; }
	[spStrap] [sp-edit="text"] { cursor:auto; word-break:break-all; }
	[spStrap] [sp-edit] > span { display:inline-block; vertical-align:middle; }
	[spStrap] [sp-scroll] { overflow:auto; }
	[spStrap] a[sp-edit], [spStrap] a { position:relative; display:inline-block; display:inline-flex; vertical-align:middle; }
	[spStrap] a, [spStrap] a { color:inherit; text-decoration:none; }
	[spStrap] [sp-clear]:after { content:' '; clear:both; display:block; font-size:0; height:0; line-height:0; visibility:hidden; }
	[spStrap] [sp-inlinebox], [spStrap] [sp-edit$="_button"] { font-size:0; }
	[spStrap] table, [spStrap] thead, [spStrap] tbody, [spStrap] tfoot, [spStrap] tr, [spStrap] th, [spStrap] td {
		border-collapse: inherit;
		border-spacing: 0;
		border-color: inherit;
		vertical-align: inherit;
		text-align: left;
		font-weight: inherit;
		-webkit-border-horizontal-spacing: 0;
		-webkit-border-vertical-spacing: 0;
	}

	[spStrap] img[sp-edit] { display:inline-block; vertical-align:middle; vertical-align:super; }
	[spStrap] [sp-line] { position:relative; text-indent:-9999px; line-height:0 !important; }
	[spStrap] [sp-line]:before { content:'.'; }
	[spStrap] [sp-line]:after { content:''; z-index:1; position:absolute; top:-5px; right:0; bottom:-5px; left:0; }
	[spStrap] [sp-table-editor] { width:100%; border-collapse:collapse; border-spacing:0; margin:0 auto; }
	[spStrap] [sp-table-editor] td { min-width:15px; word-break: break-all; position:relative; }

	/* Video PC, Mobile Ratio Buildup */
	[spStrap] [sp-videoframe] { position: relative; padding-bottom:56.25%; /* 16:9 비율인 경우 */ height:0; }
	[spStrap] [sp-videoframe="4:3"] { padding-bottom:75%; }
	[spStrap] [sp-videoframe] iframe { position: absolute; top:0; left:0; width:100%; height:100%; }
	[spStrap] [sp-ratio] { position:relative; }
	[spStrap] [sp-ratio="1:1"] { padding-bottom:100%; }
	[spStrap] [sp-ratio="1:2"] { padding-bottom:200%; }
	[spStrap] [sp-ratio="2:1"] { padding-bottom:50%; }

	/*!
     * Set Font Attribute
     */
	[spStrap] [sp-font="7"]  { font-size:0.7rem; }
	[spStrap] [sp-font="8"]  { font-size:0.8rem; }
	[spStrap] [sp-font="9"]  { font-size:0.9rem; }
	[spStrap] [sp-font="10"] { font-size:1.0rem; }
	[spStrap] [sp-font="11"] { font-size:1.1rem; }
	[spStrap] [sp-font="12"] { font-size:1.2rem; }
	[spStrap] [sp-font="13"] { font-size:1.3rem; }
	[spStrap] [sp-font="14"] { font-size:1.4rem; }
	[spStrap] [sp-font="15"] { font-size:1.5rem; }
	[spStrap] [sp-font="16"] { font-size:1.6rem; }
	[spStrap] [sp-font="17"] { font-size:1.7rem; }
	[spStrap] [sp-font="18"] { font-size:1.8rem; }
	[spStrap] [sp-font="19"] { font-size:1.9rem; }
	[spStrap] [sp-font="20"] { font-size:2.0rem; }
	[spStrap] [sp-font="25"] { font-size:2.5rem; }
	[spStrap] [sp-font="30"] { font-size:3.0rem; }
	[spStrap] [sp-font="35"] { font-size:3.5rem; }
	[spStrap] [sp-font="40"] { font-size:4.0rem; }
	[spStrap] [sp-font="45"] { font-size:4.5rem; }
	[spStrap] [sp-font="50"] { font-size:5.0rem; }
	[spStrap] [sp-font="55"] { font-size:5.5rem; }
	[spStrap] [sp-font="60"] { font-size:6.0rem; }
	[spStrap] [sp-less="pc"] { display:none; }
	[spStrap] [sp-only="tablet"], [spStrap] [sp-only="mobile"] { display:none; }

	/*!
     * Responsive Tablet, Mobile Size
     */
	@media screen and ( min-width:601px ) and ( max-width:1024px ){

		[spStrap] { line-height:1.3; }
		[spStrap] [sp-size]		  { width:auto; }
		[spStrap] [sp-font="7"]   { font-size:0.70rem }
		[spStrap] [sp-font="8"]   { font-size:0.80rem }
		[spStrap] [sp-font="9"]   { font-size:0.89rem }
		[spStrap] [sp-font="10"]  { font-size:0.99rem }
		[spStrap] [sp-font="11"]  { font-size:1.08rem }
		[spStrap] [sp-font="12"]  { font-size:1.17rem }
		[spStrap] [sp-font="13"]  { font-size:1.26rem }
		[spStrap] [sp-font="14"]  { font-size:1.35rem }
		[spStrap] [sp-font="15"]  { font-size:1.44rem }
		[spStrap] [sp-font="16"]  { font-size:1.53rem }
		[spStrap] [sp-font="17"]  { font-size:1.62rem }
		[spStrap] [sp-font="18"]  { font-size:1.70rem }
		[spStrap] [sp-font="19"]  { font-size:1.79rem }
		[spStrap] [sp-font="20"]  { font-size:1.87rem }
		[spStrap] [sp-font="25"]  { font-size:2.33rem }
		[spStrap] [sp-font="30"]  { font-size:2.78rem }
		[spStrap] [sp-font="35"]  { font-size:3.22rem }
		[spStrap] [sp-font="40"]  { font-size:3.66rem }
		[spStrap] [sp-font="45"]  { font-size:4.10rem }
		[spStrap] [sp-font="50"]  { font-size:4.53rem }
		[spStrap] [sp-font="55"]  { font-size:4.95rem }
		[spStrap] [sp-font="60"]  { font-size:5.37rem }
		[spStrap] [sp-tab="20"] { display:inline-block !important; width:20% !important; }
		[spStrap] [sp-tab="25"] { display:inline-block !important; width:25% !important; }
		[spStrap] [sp-tab="33"] { display:inline-block !important; width:33.333% !important; }
		[spStrap] [sp-tab="50"] { display:inline-block !important; width:50% !important; }
		[spStrap] [sp-tab="100"] { display:block !important; width:initial !important; }
		[spStrap] [sp-less="tablet"] { display:none; }
		[spStrap] [sp-only="pc"], [spStrap] [sp-only="mobile"] { display:none; }
		[spStrap] [sp-table-editor] { width:100% !important; min-width:unset !important; }

	}
	@media screen and ( min-width:1px ) and ( max-width:601px ){

		[spStrap] { line-height:1.2; }
		[spStrap] [sp-size]		  { width:auto; }
		[spStrap] [sp-font="7"]   { font-size:0.70rem }
		[spStrap] [sp-font="8"]   { font-size:0.79rem }
		[spStrap] [sp-font="9"]   { font-size:0.88rem }
		[spStrap] [sp-font="10"]  { font-size:0.97rem }
		[spStrap] [sp-font="11"]  { font-size:1.06rem }
		[spStrap] [sp-font="12"]  { font-size:1.14rem }
		[spStrap] [sp-font="13"]  { font-size:1.22rem }
		[spStrap] [sp-font="14"]  { font-size:1.30rem }
		[spStrap] [sp-font="15"]  { font-size:1.38rem }
		[spStrap] [sp-font="16"]  { font-size:1.46rem }
		[spStrap] [sp-font="17"]  { font-size:1.53rem }
		[spStrap] [sp-font="18"]  { font-size:1.61rem }
		[spStrap] [sp-font="19"]  { font-size:1.68rem }
		[spStrap] [sp-font="20"]  { font-size:1.75rem }
		[spStrap] [sp-font="25"]  { font-size:2.16rem }
		[spStrap] [sp-font="30"]  { font-size:2.57rem }
		[spStrap] [sp-font="35"]  { font-size:2.96rem }
		[spStrap] [sp-font="40"]  { font-size:3.35rem }
		[spStrap] [sp-font="45"]  { font-size:3.73rem }
		[spStrap] [sp-font="50"]  { font-size:4.10rem }
		[spStrap] [sp-font="55"]  { font-size:4.46rem }
		[spStrap] [sp-font="60"]  { font-size:4.81rem }
		[spStrap] [sp-mob="20"] { display:inline-block !important; width:20% !important; }
		[spStrap] [sp-mob="25"] { display:inline-block !important; width:25% !important; }
		[spStrap] [sp-mob="33"] { display:inline-block !important; width:33.333% !important; }
		[spStrap] [sp-mob="50"] { display:inline-block !important; width:50% !important; }
		[spStrap] [sp-mob="100"] { display:block !important; width:initial !important; position:initial !important; }
		[spStrap] [sp-less="mobile"] { display:none; }
		[spStrap] [sp-only="pc"], [spStrap] [sp-only="tablet"] { display:none; }
		[spStrap] [sp-scale^="mob"] {
			-webkit-transform : scale(.9);
			-moz-transform : scale(.9);
			-ms-transform : scale(.9);
			-o-transform : scale(.9);
			transform : scale(.9);
		}
		[spStrap] [sp-scale*="-tl"] { transform-origin:top left; }
		[spStrap] [sp-scale*="-tc"] { transform-origin:top center; }
		[spStrap] [sp-scale*="-tr"] { transform-origin:top right; }
		[spStrap] [sp-scale*="-ml"] { transform-origin:center left; }
		[spStrap] [sp-scale*="-mc"] { transform-origin:center center; }
		[spStrap] [sp-scale*="-mr"] { transform-origin:center right; }
		[spStrap] [sp-scale*="-bl"] { transform-origin:bottom left; }
		[spStrap] [sp-scale*="-bc"] { transform-origin:bottom center; }
		[spStrap] [sp-scale*="-br"] { transform-origin:bottom right; }
		[spStrap] [sp-table-editor] { width:100% !important; min-width:unset !important; }

	}

	/*-------------------------------------------------------------------------
    |   Code : 4BC8F294A9
    |-------------------------------------------------------------------------*/
	[spStrap] .mo-4BC8F294A9 {  }


	/*-------------------------------------------------------------------------
    |   Code : 7A26095118
    |-------------------------------------------------------------------------*/
	[spStrap] .mo-7A26095118 { position:relative; }
	[spStrap] .mo-7A26095118 [sp-edit="icon_svg"] {
		z-index:2; position:absolute !important; top:50%; left:50%;
		-webkit-transform : translateX(-50%) translateY(-50%);
		-moz-transform : translateX(-50%) translateY(-50%);
		-ms-transform : translateX(-50%) translateY(-50%);
		-o-transform : translateX(-50%) translateY(-50%);
		transform : translateX(-50%) translateY(-50%);
	}

	.form-group{
		margin-bottom: 15px;
	}

	.form-group input{
		font-size: 16px;
	}

	label{
		margin-bottom: 15px;
	}

	input,
	input::-webkit-input-placeholder {
		font-size: 16px;
		padding-top: 3px;
	}

	.main-login{
		background-color: #fff;
		/* shadows and rounded borders */
		-moz-border-radius: 2px;
		-webkit-border-radius: 2px;
		border-radius: 2px;
		-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
		-webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);

	}

	.main-center{
		font-size: 28px;
		margin: 0 auto;
		padding: 0 75px 0 75px

	}

	.login-button{
		margin-top: 5px;
	}

	.login-register{
		font-size: 11px;
		text-align: center;
	}
	.form-group input {
		height: 40px;
	}
	.form-group label {
		margin-bottom: -31px !important;
		margin-right: 6px;
		position: relative;
		z-index: 9;
		font-size: 17px;
		color: darkgray;
		display: block;
	}

	.input-group-addon {
		background-color: #b67f5f;
		color: white;
	}

	.circle {
		display: inline-block;
		width: 35px;
		height: 35px;
		border-radius: 50%;
		cursor: pointer;
	}

	/* 원을 선택한 경우, 해당 원 투명도 연하게 */
	.selected-circle {
		opacity: 0.2;
	}

	/* 항목 이름을 숨기기 위한 클래스 */
	.hidden {
		display: none;
	}

	.item-name {
		font-size: 25px;
		position: absolute;
		top: 641px;
		right: 74px;
	}

	.in_circle {
		display: table;
		margin: 8px 0 0 9px;
		color: white;
		font-weight: 900;
	}

	/* 선택된 항목을 표시하기 위한 박스 */
	.selected-items {
		border: 1px solid #ccc;
		padding: 9px;
		margin-top: 10px;
		min-height: 40px;
		width: 564px;
		margin-left: -25px;
		background-color: black;
		color: white;
		font-weight: 900;
	}
	.form-control {
		font-size: 25px;
		font-weight: 600;
	}

</style>

<style sp-template-font="mo-D5BFD24B0D" data-main="Roboto" data-sub="Noto Sans KR">
	/*  */
</style>
<style sp-stylesheet="mo-D5BFD24B0D">
	/*-------------------------------------------------------------------------
    |   Code : 2F2460FF2F
    |-------------------------------------------------------------------------*/
	[spStrap] .mo-D5BFD24B0D {
		position: relative;
	}

	[spStrap] .mo-D5BFD24B0D--text {
		display: inline-block;
		position: relative;
		z-index: 2;
	}

	[spStrap] .mo-D5BFD24B0D--line {
		z-index: 1;
		position: absolute;
		top: 50%;
		left: 0;
		-webkit-transform: translateY(-50%);
		-moz-transform: translateY(-50%);
		-ms-transform: translateY(-50%);
		-o-transform: translateY(-50%);
		transform: translateY(-50%);
	}

	.map_wrap {position:relative;width:100%;height:350px;}
	.title {font-weight:bold;display:block;}
	.hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
	#centerAddr {display:block;margin-top:2px;font-weight: normal;}
	.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}

</style>

<body>
<%-- -------------------------------------------------------------------------- --%>
<section>
	<!-- -------------------------------------------------------------------------- -->
	<div id="map" style="width:95%;height:85%; margin: 0 auto; display: flex"></div>
	<p style="margin-left: 30px" id="result"></p>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a87543beac34ad8d2b278a24584916c9&libraries=services,clusterer,drawing"></script>
	<script>

		function clickPicture(ImgUrl) {
			Swal.fire({
				imageUrl: '/display?fileName='+ImgUrl,
				imageWidth: 800,
				imageHeight: 600,
				width : 800,
				height : 600,
				showConfirmButton: false
			})
		}

		var container = document.getElementById('map');
		var writeX = sessionStorage.getItem("writeX");
		var writeY = sessionStorage.getItem("writeY");

		if(writeX&&writeY) {
			var defaultGPS = new kakao.maps.LatLng(writeX, writeY);
			sessionStorage.removeItem("writeX");
			sessionStorage.removeItem("writeY");
		} else {
			var defaultGPS = new kakao.maps.LatLng(35.156254720925176, 129.05941094198724);
		}
		var options = {
			center: defaultGPS,
			level: 2
		};

		var map = new kakao.maps.Map(container, options);

		// ------------------------------------------- 마커/주소/인포윈도우 -----------------------------------

		var geocoder = new kakao.maps.services.Geocoder();

		var widthCoordinate = ""
		var heightCoordinate = ""
		var address = "";
		var jibunAddress = "";


		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);

			widthCoordinate = coords.getLat();
			heightCoordinate = coords.getLng();
		}

		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
					detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';

					address = !!result[0].road_address ? result[0].road_address.address_name : '';
					jibunAddress = result[0].address.address_name;

					var content = '<div class="bAddr" style="border: 10px">' +
							'<span class="title">법정동 주소정보</span>' +
							detailAddr +
							'</div>' +
							'<div style="display: flex; margin: -3px 0 0 0; height: 40px; justify-content: center;">' +
							'<button onclick="addCustomPlace()" type="button" class="btn btn-primary" style="background-color: #b67f5f; border-color: black; height: 30px;"><i class="fa-solid fa-mug-saucer"></i> 장소 저장</button>' +
							'</div>';

					// 마커를 클릭한 위치에 표시합니다
					marker.setPosition(mouseEvent.latLng);
					marker.setMap(map);

					// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					infowindow.setContent(content);
					infowindow.open(map, marker);
				}
			});
		});

		function addCustomPlace() {
			Swal.fire({
				width : 700
				, showConfirmButton : false
				, html: `<div class="container" style="width: 100%; min-height: 700px">
			<div class="row main">
				<div class="panel-heading" style="padding: 0px 10px;">
	               <div class="panel-title text-center">
	               		<h1 class="title">카페 등록</h1>
	               	</div>
	            </div>
				<div class="main-login main-center">
					<form class="form-horizontal" id="writePlaceForm" method="post" action="#">

						<div class="select_img"><img id="previewImage" src="../../resources/imgs/defaultPic.png" style="width: 500px; height: 400px; border-radius: 10px;"/></div>

							<div style="display: none">
								<input name="imgPath"  id="fileInputTag" type="file" class="form-control" aria-label="file example" required accept="image/*">
								<button id="writeBtn2" type="button" class="btn btn-primary" style="padding: 20px;"><i class="fa-solid fa-check"></i>사진 업로드</button>
							</div>
							<label for="fileInputTag" class="btn btn-primary"
								   style="background-color: #b67f5f; border-color: black; margin: 10px"><i class="fa-solid fa-camera"></i> 사진 넣기</label>

						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label" style="width: 35px; float: right;">이름</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa-solid fa-mug-hot" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="name" id="name"  placeholder="카페 이름을 써 주세요"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="placeInfo" class="cols-sm-2 control-label" style="width: 35px; float: right;">설명</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa-solid fa-pen-to-square" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="placeInfo" id="placeInfo"  placeholder="카페 설명을 간단히 써 주세요"/>
								</div>
							</div>
						</div>
						<div class="mt-4" style="font-size: 18px">
							<p class="cate_container" style="font-weight: 900">카페에 맞는 태그를 골라주세요!</p>
							<!-- 둥근 원을 나타내는 div 요소들 -->
							<div class="circle" style="background-color: #127822" data-value="1" data-item="스페셜티"><p class="in_circle">스</p></div>
							<div class="circle" style="background-color: #ce4e09" data-value="10" data-item="자가배전"><p class="in_circle">자</p></div>
							<div class="circle" style="background-color: #a07504" data-value="100" data-item="약배전"><p class="in_circle">약</p></div>
							<div class="circle" style="background-color: #311c00" data-value="1000" data-item="강배전"><p class="in_circle">강</p></div>
							<div class="circle" style="background-color: #beb006" data-value="10000" data-item="베이커리"><p class="in_circle">베</p></div>
							<div class="circle" style="background-color: #5d391c" data-value="100000" data-item="앤틱"><p class="in_circle">앤</p></div>
							<div class="circle" style="background-color: #0b35b7" data-value="1000000" data-item="모던"><p class="in_circle">모</p></div>
							<div class="circle" style="background-color: #990080" data-value="10000000" data-item="힙"><p class="in_circle">힙</p></div>
							<div class="selected-items">
										<strong></strong>
										<span id="selectedItems"></span>
							</div>
								<input type="hidden" name ="category" id="totalValue" class="form-control" value="100000000">
								<input type="hidden" name ="widthCoordinate" id="widthCoordinate" class="form-control">
								<input type="hidden" name ="heightCoordinate" id="heightCoordinate" class="form-control">
								<input type="hidden" name ="address" id="address" class="form-control">
								<input type="hidden" name ="jibunAddress" id="jibunAddress" class="form-control">
								<input type="hidden" name ="userId" id="userId" class="form-control" value="${userDto.userId}">
						</div>

<!--						<div class="form-group">-->
<!--							<label for="username" class="cols-sm-2 control-label">Username</label>-->
<!--							<div class="cols-sm-10">-->
<!--								<div class="input-group">-->
<!--									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>-->
<!--									<input type="text" class="form-control" name="username" id="username"  placeholder="Enter your Username"/>-->
<!--								</div>-->
<!--							</div>-->
<!--						</div>-->

<!--						<div class="form-group">-->
<!--							<label for="password" class="cols-sm-2 control-label">Password</label>-->
<!--							<div class="cols-sm-10">-->
<!--								<div class="input-group">-->
<!--									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>-->
<!--									<input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password"/>-->
<!--								</div>-->
<!--							</div>-->
<!--						</div>-->

<!--						<div class="form-group">-->
<!--							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>-->
<!--							<div class="cols-sm-10">-->
<!--								<div class="input-group">-->
<!--									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>-->
<!--									<input type="password" class="form-control" name="confirm" id="confirm"  placeholder="Confirm your Password"/>-->
<!--								</div>-->
<!--							</div>-->
<!--						</div>-->

						<div class="form-group ">
							<button type="button" id="writePlace" class="btn btn-primary btn-lg btn-block login-button" style="background-color: #bbbbbb" disabled>등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>`
			})
		}

		var imageSrc2 = '../../resources/imgs/cafap_logo.png', // 마커이미지의 주소입니다
				imageSize2 = new kakao.maps.Size(40, 44), // 마커이미지의 크기입니다
				imageOption2 = {offset: new kakao.maps.Point(19, 44)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		var marker = new kakao.maps.Marker({
					image: new kakao.maps.MarkerImage(imageSrc2, imageSize2, imageOption2)
				}), // 클릭한 위치를 표시할 마커입니다
				infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// ------------------------------------------- 마커/주소/인포윈도우 -----------------------------------

		var startSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 마커이미지의 주소입니다
			startSize = new kakao.maps.Size(50, 45), // 마커이미지의 크기입니다
			startOption = {offset: new kakao.maps.Point(15, 43)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		var defaultMarker = new kakao.maps.Marker({
			position: defaultGPS,
			image: new kakao.maps.MarkerImage(startSrc, startSize, startOption)
		});
		defaultMarker.setMap(map);

		// 커스텀 오버레이를 담을 배열
		var overlays = [];

		var imageSrc = '../../resources/imgs/cafap_logo.png', // 마커이미지의 주소입니다
			imageSize = new kakao.maps.Size(40, 44), // 마커이미지의 크기입니다
			imageOption = {offset: new kakao.maps.Point(21, 40)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		<c:forEach items="${list}" var="dto" varStatus="status">
		// DB에서 가져온 위치 정보를 기반으로 커스텀 오버레이를 생성하고 지도에 추가하는 함수

		function addCustomOverlay_${dto.placeId}() {
			var marker = new kakao.maps.Marker({
				map: map,
				position: new kakao.maps.LatLng(${dto.widthCoordinate}, ${dto.heightCoordinate}),
				image: new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
			});

			var content = `
				<div class="wrap">
				  <div class="info">
					<div class="title">${dto.name}<div class="close" onclick="closeOverlay()" title="닫기"></div></div>
					<div class="body">
					  <div class="img">
						<img src="/display?fileName=${dto.imgPath}" style="border-radius: 5px" width="73" height="70" onclick="clickPicture('${dto.imgPath}')">
					  </div>
					  <div class="desc" onclick="placeInfo_${dto.placeId}()">
						<div class="ellipsis">${dto.address}</div>
						<div class="jibun ellipsis">${dto.jibunAddress}</div>
						<%--<div><a href="${dto.homepage}" target="_blank" class="link">홈페이지</a>&nbsp;&nbsp;--%>
						<%--</div>--%>
						</div>
					  </div>
					</div>
				  </div>
    		  `;


			var overlay = new kakao.maps.CustomOverlay({
				content: content,
				map: map,
				position: marker.getPosition()
			});

			overlays.push(overlay);

			kakao.maps.event.addListener(marker, 'click', function () {
				overlay.setMap(map);
			});
		}

		function placeInfo_${dto.placeId}() {
			Swal.fire({
				width : 900
				, showConfirmButton : false
				, html: `<div id="spStrap" sp-contents class="initialize" spstrap>
							<div class="mo-4BC8F294A9 initialize" sp-edit="box" sp-sort-nodrop="fixed">
								<div sp-edit="box" sp-size sp-sort-nodrop="element" style="" class="initialize">
									<div sp-edit="box" style="text-align:center;" class="initialize" area="before"
										draggable="false">
										<a href="#!" sp-edit="image_button" sp-resize style="width:80%;" class="initialize"
											draggable="false"><img
												src="/display?fileName=${dto.imgPath}" sp-edit="image"
												style="width:100%; height: 520px; border-radius: 5px" class="initialize" draggable="false"></a>
									</div>

									<div sp-edit="text" style="padding: 10px 0 0 0; text-align:center;" class="initialize" area="before"><span
											sp-font="40" style="color:#333;"><b>${dto.name}</b></span></div>
									<div sp-edit="text" style="text-align:center;" class="initialize" area="before" draggable="false">
										<span sp-font="20" style="color:#888;" draggable="false">${dto.placeInfo}</span><br draggable="false">
									</div>
									<div sp-edit="text" style="text-align:center;" class="initialize" area="before" draggable="false">
										<span sp-font="12" style="color:#888; margin-bottom: 3px;" draggable="false">
										<a href="https://map.naver.com/?dlevel=12&query=${dto.name}" target="_blank">${dto.address} ${dto.jibunAddress}</a>
										</span><br draggable="false">
									</div>

									<div sp-edit="text" style="line-height:2;text-align:center;" class="initialize"
										area="before" draggable="false"><span sp-font="20" style="color:#fff;background-color:#b67f5f;;"
											draggable="false"><b draggable="false">
											&nbsp;&nbsp;${dto.category}&nbsp;
											</b></span>
											</div>

									<div class="mo-7A26095118 initialize" sp-edit="box" sp-sort-nodrop="fixed"
										style="padding:1.5rem 0; text-align:center;">
										<img sp-edit="icon_svg"
											src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='9' height='9' fill='%234b5566' viewBox='0 0 24 24'%3E%3Cpath d='M18 2l6 10.5-6 10.5h-12l-6-10.5 6-10.5z'/%3E%3C/svg%3E"
											class="initialize">
										<div sp-edit="box" sp-line style="border-top:0.01rem solid rgba(0,0,0,0.05);" class="initialize">‧</div>
									</div>
									<div class="mo-D5BFD24B0D initialize" sp-edit="box" sp-sort-nodrop="fixed"
										style="text-align:left;padding-bottom: 15px;">
										<div sp-edit="box" sp-size class="initialize">

											<div class="mo-D5BFD24B0D--line initialize" sp-edit="background"
												style="padding:.4rem 0;width:100%; text-align: center; background-image:url(&quot;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' version='1.1' fill='%23333333' viewBox='0 0 100 100'%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Crect y='40' width='100' height='20'/%3E%3C/g%3E%3C/g%3E%3C/g%3E%3C/svg%3E&quot;); background-repeat: repeat-x; background-position: center center;">
											</div>

										</div>
									</div>

						<button type="button" class="swal2-confirm swal2-styled" onclick="deletePlace(${dto.placeId}, ${dto.widthCoordinate}, ${dto.heightCoordinate})"
							style="
										display: inline-block;
										height: 38px;
										width: 53px;
										padding: 0px;
										margin: 0px 0;
										background-color: #b67f5f;
										font-size: 20px;
										/* border-radius: 0; */
										float: right;
										font-weight: 900;
										font-family: Jal_Onuel;
							">
						삭제</button>

								</div>
							</div>
						</div>`
			})
		}

		$(document).on("click", "#writeCheck_${dto.placeId}" ,function() {
			var formData = $("#writeForm_${dto.placeId}").serialize();

			$.ajax({
				type: "POST"
				,data: formData
				,url: "boardWrite"
				,success: function(data, status){
					if (data === 200) {
						reload_${dto.placeId}()
					} else {
						Swal.fire({
							icon: 'warning',
							title: '실패',
							text: "로그인 해주세요!",
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

		function reload_${dto.placeId}() {
			sessionStorage.setItem("reloading", "true");
			sessionStorage.setItem("writeDtoId", ${dto.placeId});
			sessionStorage.setItem("writeX", ${dto.widthCoordinate});
			sessionStorage.setItem("writeY", ${dto.heightCoordinate});
			document.location.reload();
		}

		function loginGo_${dto.placeId}() {
			sessionStorage.setItem("reloading", "true");
			sessionStorage.setItem("writeDtoId", ${dto.placeId});
			sessionStorage.setItem("writeX", ${dto.widthCoordinate});
			sessionStorage.setItem("writeY", ${dto.heightCoordinate});
			location.href="/login";
		}

		addCustomOverlay_${dto.placeId}();
		</c:forEach>

		// 커스텀 오버레이를 닫는 함수
		function closeOverlay() {
			overlays.forEach(function (overlay) {
				overlay.setMap(null);
			});
		}


	</script>
</section>
<%@ include file="../views/common/footer.jsp" %>
</body>
<script>
	$(document).ready(function() {
		var reloading = sessionStorage.getItem("reloading");
		var writeDtoId = sessionStorage.getItem("writeDtoId");
		if (reloading) {
			sessionStorage.removeItem("reloading");
				if(!!writeDtoId) {
				var functionName = "placeInfo_" + writeDtoId; // 함수 이름 동적으로 생성
				sessionStorage.removeItem("writeDtoId");
				if (typeof window[functionName] === 'function') {
					window[functionName](); // 동적으로 생성된 함수 실행
				}
			}
		}

		$(document).on("change", "input[name='imgPath']", function() {
			if (this.files && this.files[0]) {
				var reader = new FileReader();
				reader.onload = function(data) {
					// 미리 보기할 이미지를 선택하고 크기 설정
					$("#previewImage").attr("src", data.target.result).css("width", "500px");
				};
				reader.readAsDataURL(this.files[0]);
			}
		});

		$(document).on("click", ".circle", function() {
		// $(".circle").click(function () {
			// 선택한 둥근 원에 선택 클래스 추가 (테두리 표시)
			$(this).toggleClass("selected-circle");

			// 선택한 둥근 원들의 값을 합산하여 결과 input 요소에 표시
			calculateTotal();

			// 해당 원의 항목 이름을 표시하고 2초 후에 사라지도록 합니다.
			displayItemName($(this).attr("data-item"));

			// 선택한 항목들을 표시하는 박스 업데이트
			updateSelectedItems();
		});

		function calculateTotal() {
			var total = 100000000;
			// 선택된 둥근 원들을 찾아서 값을 합산합니다.
			$(".circle.selected-circle").each(function () {
				var value = parseInt($(this).attr("data-value"));
				total += value;
			});

			// 합산된 값을 결과 input 요소에 표시합니다.
			$("#totalValue").val(total);
		}

		function displayItemName(itemName) {
			var itemNameElement = $("<div class='item-name'>" + itemName + "</div>");
			$(".cate_container").append(itemNameElement);

			// 2초 후에 항목 이름 요소를 서서히 사라지게 합니다.
			setTimeout(function () {
				itemNameElement.fadeOut(500, function () {
					itemNameElement.remove();
				});
			}, 10);
		}

		function updateSelectedItems() {
			var selectedItems = [];
			// 선택된 항목들을 찾아서 배열에 추가합니다.
			$(".circle.selected-circle").each(function () {
				var itemName = "#" + $(this).attr("data-item"); // 항목 이름 앞에 "#"를 붙입니다.
				selectedItems.push(itemName);
			});

			// 선택한 항목들을 표시하는 박스 업데이트
			$("#selectedItems").text(selectedItems.join(" "));
		}

		let placeName = document.querySelector("#name");
		let placeInfo = document.querySelector("#placeInfo");

		$(document).on("keyup", "#name" ,function() {
			$("#widthCoordinate").val(widthCoordinate);
			$("#heightCoordinate").val(heightCoordinate);
			$("#address").val(address);
			$("#jibunAddress").val(jibunAddress);
			placeName = document.querySelector("#name");
			placeInfo = document.querySelector("#placeInfo");
			switch(!(placeName.value && placeInfo.value)){
				case false : $("#writePlace").prop("disabled", false); $("#writePlace").css("background", "#b67f5f"); break;
				case true : $("#writePlace").prop("disabled", true); $("#writePlace").css("background", "#bbbbbb"); break;
			}
		});

		$(document).on("keyup", "#placeInfo" ,function() {
			$("#widthCoordinate").val(widthCoordinate);
			$("#heightCoordinate").val(heightCoordinate);
			$("#address").val(address);
			$("#jibunAddress").val(jibunAddress);
			placeName = document.querySelector("#name");
			placeInfo = document.querySelector("#placeInfo");
			switch(!(placeName.value && placeInfo.value)){
				case false : $("#writePlace").prop("disabled", false); $("#writePlace").css("background", "#b67f5f"); break;
				case true : $("#writePlace").prop("disabled", true); $("#writePlace").css("background", "#bbbbbb"); break;
			}
		});


		$(document).on("click", "#writePlace", function() {
			var formData = new FormData(document.getElementById('writePlaceForm'));
			var inputFile = $("input[name='imgPath']");
			files = inputFile[0].files;

			for (var i = 0; i < files.length; i++) {
				formData.append("uploadFile", files[i]);
			}
//         var formData = $("#uploadForm").serialize();
			$.ajax({
				url: 'writePlace',
				type: 'POST',
				processData: false,
				contentType: false,
				data: formData,
				success: function (data) {
					if (data === 400) {
						alert('사진을 넣어 주세요!');
					} else {
						Swal.fire({
							icon: 'success',
							title: '등록 완료',
							text: "카페 등록이 완료되었읍니다",
							showCancelButton: false,
							confirmButtonText: '확인'
							// 인증 성공하면 이메일 계정 입력부분 비활성화 및 색상변경(grey)
						}).then(function(){
							sessionStorage.setItem("reloading", "true");
							sessionStorage.setItem("writeDtoId", data);
							sessionStorage.setItem("writeX", $("#widthCoordinate").val(widthCoordinate));
							sessionStorage.setItem("writeY", $("#heightCoordinate").val(heightCoordinate));
							document.location.reload();
						});
					}
				},
				error: function () {
					alert('서버 문제입니다');
				}
			});
		});
	});

	function deletePlace(placeId, widthCoordinate, heightCoordinate) {
		console.log(placeId);
		var formData = {
			placeId : placeId
		};
		if(confirm("정말 삭제하시겠읍니까?")) {
			$.ajax({
				type: "POST"
				,data: formData
				,url: "placeDelete"
				,success: function(data, status){
					if (data === 200) {
						sessionStorage.setItem("reloading", "true");
						sessionStorage.setItem("writeX", widthCoordinate);
						sessionStorage.setItem("writeY", heightCoordinate);
						document.location.reload();
					} else {
						Swal.fire({
							icon: 'warning',
							title: '실패',
							text: "로그인 해주세요!",
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
	}

</script>


</html>