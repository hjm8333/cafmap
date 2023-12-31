<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<head>
	<title>Cafap</title>
	<%@ include file="../views/common/navbar.jsp" %>
</head>
<style>
	.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Jal_Onuel', dotum, '돋움', sans-serif;line-height: 1.5;}
	.wrap * {padding: 0;margin: 0;}
	.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	.info .title {padding-left: 8px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 21px;font-weight: 500; font-family: 'Jal_Onuel'}
	.info .close {position: absolute;top: 7px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	.info .close:hover {cursor: pointer;}
	.info .body {position: relative;overflow: hidden;}
	.info .desc {position: relative;margin: 5px 0 0 90px;height: 75px;}
	.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
	.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
	.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	.info .link {color: #5085BB;}
		 /*!
          * spStrap font
          */
	@import url("https://fonts.googleapis.com/css2?&family=Roboto:wght@300%3B700&display=swap");
	@import url("https://fonts.googleapis.com/css2?&family=Noto+Sans+KR:wght@300%3B500&display=swap");
	#spStrap[sp-contents],
	#spStrap [sp-contents] { font-family: 'Jal_Onuel',Noto Sans KR,'Apple SD Gothic Neo', 'arial', 'sans-serif', 'serif', 'Noto Color Emoji', 'Apple Color Emoji', 'Segoe UI Emoji'; }
	#spStrap [sp-fontfamily="main"] { font-family: 'Jal_Onuel', 'Apple SD Gothic Neo', 'arial', 'sans-serif', 'serif', 'Noto Color Emoji', 'Apple Color Emoji', 'Segoe UI Emoji'; }
	#spStrap [sp-fontfamily="sub"] { font-family: 'Jal_Onuel', 'Apple SD Gothic Neo', 'arial', 'sans-serif', 'serif', 'Noto Color Emoji', 'Apple Color Emoji', 'Segoe UI Emoji'; }

	/*!
     * Mocanvas
     * @license https://www.mocanvas.com
     * @min-width : Samsung Galaxy S, Apple iPhone 5 (5c, 5s)
     */

	/*!
     * Container Buildup
     */
	#spStrap *:not(i) { font-family: 'Jal_Onuel'; }

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

	.star {
		position: relative;
		color: #ddd;
		font-size: 35px;
		word-break: normal;
		word-wrap: normal;
	}

	.star input {
		width: 100%;
		height: 100%;
		position: absolute;
		left: 0;
		opacity: 0;
		cursor: pointer;
		display: initial;
		top: 5px;
	}

	.star span {
		width: 0;
		position: absolute;
		left: 0;
		color: #b67f5f;
		overflow: hidden;
		pointer-events: none;
		text-shadow: -1px 0 #b67f5f, 0 1px #b67f5f, 1px 0 #b67f5f, 0 -1px #b67f5f;
	}

	input[type="text"], .login-show input[type="password"]{
		width: 67%;
		margin: 0 0;
		padding: 5px;
		border: 1px solid black;
		outline: none;
		font-size: 1.5em;
		display: inline-block;
		color: black;
	}

	input[type="button"] {
		max-width: 100px;
		width: 100%;
		background: #444444;
		color: #f9f9f9;
		border: none;
		padding: 6px;
		text-transform: uppercase;
		border-radius: 2px;
		float: right;
		cursor: pointer;
		display: inline-block;
		font-size: 1.5em;
	}

	.img-circle {
		width: 35px;
		height: 35px;
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
</style>

<body>
<%-- -------------------------------------------------------------------------- --%>
<section>
	<!-- -------------------------------------------------------------------------- -->

	<div id="map" style="width:95%;height:85%; margin: 0 auto; display: flex"></div>
	<p id="result" style="    display: flex;
    justify-content: center;"></p>


	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a87543beac34ad8d2b278a24584916c9&libraries=services,clusterer,drawing"></script>
	<script>

		function drawStar(target){
			document.querySelector(`#placeScore`).style.width = `${'${target.value * 10}'}%`;
		}

		function clickPicture(ImgUrl) {
			Swal.fire({
				imageUrl: ImgUrl,
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


		// 클릭시 좌표표시 함수
		/*
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

			// 클릭한 위도, 경도 정보를 가져옵니다
			var latlng = mouseEvent.latLng;

			var message = '위도 ' + latlng.getLat() + '<br>';
			message += '경도 ' + latlng.getLng();

			var resultDiv = document.getElementById('result');
			resultDiv.innerHTML = message;

		});
		 */

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

		<c:set var="existingMyReview" value="${false}"/>
		<c:forEach items="${dto.boardDtoList}" var="boardDto">
			<c:if test="${boardDto.memDto.userId == userDto.userId}">
				<c:set var="existingMyReview" value="${true}"/>
			</c:if>
		</c:forEach>

		function addCustomOverlay_${dto.placeId}() {
			var marker = new kakao.maps.Marker({
				map: map,
				position: new kakao.maps.LatLng(${dto.widthCoordinate}, ${dto.heightCoordinate}),
				image: new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
			});

			var content = `
				<div class="wrap">
				  <div class="info">
					<div class="title" style="font-family: 'Jal_Onuel';">${dto.name}<div class="close" onclick="closeOverlay()" title="닫기"></div></div>
					<div class="body">
					  <div class="img">
						<img src="${dto.imgPath}" style="border-radius: 5px" width="73" height="70" onclick="clickPicture('${dto.imgPath}')">
					  </div>
					  <div class="desc" onclick="placeInfo_${dto.placeId}()">
						<div class="ellipsis">${dto.address}</div>
						<div class="jibun ellipsis">${dto.jibunAddress}</div>
						<div><a href="${dto.homepage}" target="_blank" class="link">홈페이지</a>&nbsp;&nbsp;
							<c:if test="${(not empty userDto) and existingMyReview}">
							<text style="color: #b67f5f;">내가 리뷰한 카페</text>
							</c:if>
						</div>
							<span>
								<div style="display: inline-block; vertical-align: middle;">
									<span class="star" style="position: absolute;
										top: 45px;
										left: -2px;
										color: #ddd;
										font-size: 20px;
										word-break: normal;
										word-wrap: normal;">
										★★★★★
										<span style="width: ${dto.avgScore * 20}%;">★★★★★</span>
									</span>
								</div>
									<text style="color: #b67f5f;
										font-size: 18px;
										display: inline-block;
										vertical-align: middle;
										text-align: right;
										position: absolute;
										bottom: 0px;
										right: 71px;">${dto.avgScore}</text>
									<text style="color: #black;
										    font-size: 14px;
											display: inline-block;
											vertical-align: middle;
											text-align: right;
											position: absolute;
											bottom: 2px;
											right: 4px;">리뷰 ${dto.countReview}개</text>
							</span>
						</div>
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
												src="${dto.imgPath}" sp-edit="image"
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

											<span>
												<div style="display: inline-block; vertical-align: middle;">
													<span class="star" style="position: absolute;
																			    top: -112px;
    																			right: 80px;
																			color: #ddd;
																			font-size: 35px;
																			word-break: normal;
																			word-wrap: normal;">
														★★★★★
														<span style="width: ${dto.avgScore * 20}%;">★★★★★</span>
													</span>
												</div>
													<text style="color: #b67f5f;
														font-size: 30px;
														display: inline-block;
														vertical-align: middle;
														text-align: right;
														position: absolute;
														bottom: 87px;
														right: 22px;">${dto.avgScore}</text>
											</span>
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

											<div class="mo-D5BFD24B0D--text initialize" sp-edit="text"
												style="padding:1rem 1.5rem;border:.2rem solid #333;background-color:#fff;"><span sp-font="20"
													style="color:#333;"><b>한줄리뷰</b></span>
											</div>

											<div class="mo-D5BFD24B0D--line initialize" sp-edit="background"
												style="padding:.4rem 0;width:100%; text-align: center; background-image:url(&quot;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' version='1.1' fill='%23333333' viewBox='0 0 100 100'%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Crect y='40' width='100' height='20'/%3E%3C/g%3E%3C/g%3E%3C/g%3E%3C/svg%3E&quot;); background-repeat: repeat-x; background-position: center center;">
											</div>

										</div>
									</div>
										<c:forEach items="${dto.boardDtoList}" var="boardDto">
											<div sp-edit="text" style="text-align:left;" class="initialize" area="before" draggable="false">
												<span sp-font="18" style="color:black; margin-bottom: 3px;" draggable="false">
													<c:choose>
														<c:when test="${boardDto.memDto.imgPath == null}">
															<img src="../../resources/imgs/userDefaultIcon.png" class="img-circle">
														</c:when>
														<c:otherwise>
															<img src="/display?fileName=${boardDto.memDto.imgPath}" class="img-circle">
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${boardDto.memDto.userId == userDto.userId}">
															<span style="font-weight: 900; color: #b67f5f">
																${boardDto.memDto.nickname}
															</span>
														</c:when>
														<c:otherwise>
															<span style="font-weight: 900;">
																${boardDto.memDto.nickname}
															</span>
														</c:otherwise>
													</c:choose>
													<span style="font-weight: 900; position: relative; bottom: 0px;">:</span>
													${boardDto.content}
													<span>
														<div style="display: inline-block; vertical-align: middle;">
															<span class="star" style="
																top: 1px;
																color: #ddd;
																font-size: 25px;
																word-break: normal;
																word-wrap: normal;">
																★★★★★
																<span style="width: ${boardDto.placeScore * 20}%;">★★★★★</span>
															</span>
														</div>
													</span>
													<span sp-font="16" style="bottom: 0px; position: relative;"><fmt:formatDate value="${boardDto.created}" dateStyle="default"/>
														<c:if test="${boardDto.memDto.userId == userDto.userId}">
															<button type="button" class="swal2-confirm swal2-styled" onclick="deleteBoard_${dto.placeId}(${boardDto.boardId})"
																style="
																    display: inline-block;
																	height: 30px;
																	width: 45px;
																	padding: 0px;
																	margin: 0px 0;
																	background-color: #b67f5f;
																	font-size: 1em;
																">
															삭제</button>
														</c:if>
													</span>
												</span><br draggable="false">
											</div>
										</c:forEach>

										<c:choose>
											<c:when test="${(not empty userDto) and !existingMyReview}">
												<div>
													<form style="display: initial;" id="writeForm_${dto.placeId}">
													<input style="margin-left: -17px;" type="text" name="content" id="writeInput" placeholder="리뷰를 작성해 보세요!">
													<span>
														<div style="display: inline-block; vertical-align: middle; margin-bottom: -3px;">
															<span class="star">
																★★★★★
																<span id="placeScore" style="width : 60%;">★★★★★</span>
																<input type="range" name="placeScore" id="starVal" oninput="drawStar(this)" value="6" step="1" min="0" max="10">
															</span>
														</div>
													</span>
														<input style="margin-top: 4px; background-color: #bbbbbb;" id="writeCheck_${dto.placeId}" type="button" value="작성" disabled>
														<input type="hidden" value="${dto.placeId}" name="placeId">
													</form>
												</div>
											</c:when>
											<c:when test="${empty userDto}">
											<div>
												<button type="button" class="swal2-confirm swal2-styled" onclick="loginGo_${dto.placeId}()"
													style="
													display: inline-block;
													height: 45px;
													width: 367;
													padding: 0px;
													margin: 0px 0;
													background-color: #b67f5f;
													font-size: 2.5em;
													">
												로그인하고 리뷰 쓰기</button>
											</div>
											</c:when>
										</c:choose>
								</div>
							</div>
						</div>`
			})
		}

		$(document).on("click", "#starVal" ,function() {
			let writeOk_${dto.placeId} = document.querySelector("#writeInput");
			let starOk_${dto.placeId} = document.querySelector("#starVal");
			switch(!(writeOk_${dto.placeId}.value && starOk_${dto.placeId}.value)){
				case false : $("#writeCheck_${dto.placeId}").prop("disabled", false); $("#writeCheck_${dto.placeId}").css("background", "#444444"); break;
				case true : $("#writeCheck_${dto.placeId}").prop("disabled", true); $("#writeCheck_${dto.placeId}").css("background", "#bbbbbb"); break;
			}
		})

		$(document).on("keyup", "#writeInput" ,function() {
			let writeOk_${dto.placeId} = document.querySelector("#writeInput");
			let starOk_${dto.placeId} = document.querySelector("#starVal");
			switch(!(writeOk_${dto.placeId}.value && starOk_${dto.placeId}.value)){
				case false : $("#writeCheck_${dto.placeId}").prop("disabled", false); $("#writeCheck_${dto.placeId}").css("background", "#444444"); break;
				case true : $("#writeCheck_${dto.placeId}").prop("disabled", true); $("#writeCheck_${dto.placeId}").css("background", "#bbbbbb"); break;
			}
		})

		function deleteBoard_${dto.placeId}(deleteData) {

			if(!confirm("정말 삭제하시겠읍니까?")) return false;
			var formData = {
				boardId : deleteData
			};

			console.log(formData);
			$.ajax({
				type: "POST"
				,data: formData
				,url: "boardDelete"
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
			var functionName = "placeInfo_" + writeDtoId; // 함수 이름 동적으로 생성
			sessionStorage.removeItem("writeDtoId");
			if (typeof window[functionName] === 'function') {
				window[functionName](); // 동적으로 생성된 함수 실행
			}
		}
	});
</script>


</html>