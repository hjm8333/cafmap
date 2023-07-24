<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
	<title>login</title>
	<%@ include file="../views/common/navbar.jsp" %>
</head>
<style>
	.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	.wrap * {padding: 0;margin: 0;}
	.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
	.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	.info .close:hover {cursor: pointer;}
	.info .body {position: relative;overflow: hidden;}
	.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
	.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
	.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
	.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	.info .link {color: #5085BB;}
</style>
<body>
<%-- -------------------------------------------------------------------------- --%>
<section>
	<!-- -------------------------------------------------------------------------- -->
	<div id="map" style="width:95%;height:85%; margin: 0 auto; display: flex"></div>
	<p style="margin-left: 30px" id="result"></p>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a49a7c1824f6f1b876a5be57e1d95b8f"></script>
	<script>
		var container = document.getElementById('map');
		var defaultGPS = new kakao.maps.LatLng(35.156254720925176, 129.05941094198724);
		var options = {
			center: defaultGPS,
			level: 2
		};

		var map = new kakao.maps.Map(container, options);

		var marker = new kakao.maps.Marker({
			map: map,
			position: new kakao.maps.LatLng(35.2000536502156 , 129.08923386614697)
		});

		var content = '<div class="wrap">' +
				'    <div class="info">' +
				'        <div class="title">' +
				'            얼룩개' +
				'            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
				'        </div>' +
				'        <div class="body">' +
				'            <div class="img">' +
				'                <img src="../../resources/imgs/alookat.jpg" width="73" height="70">' +
				'           </div>' +
				'            <div class="desc">' +
				'                <div class="ellipsis">부산 동래구 충렬대로272번길 15 2층 202호</div>' +
				'                <div class="jibun ellipsis">(우) 47879 (지번) 낙민동 211-5</div>' +
				'                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
				'            </div>' +
				'        </div>' +
				'    </div>' +
				'</div>';

		var overlay = new kakao.maps.CustomOverlay({
			content: content,
			map: map,
			position: marker.getPosition()
		});

		kakao.maps.event.addListener(marker, 'click', function() {
			overlay.setMap(map);
		});

		function closeOverlay() {
			overlay.setMap(null);
		}

		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

			// 클릭한 위도, 경도 정보를 가져옵니다
			var latlng = mouseEvent.latLng;

			var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
			message += '경도는 ' + latlng.getLng() + ' 입니다';

			var resultDiv = document.getElementById('result');
			resultDiv.innerHTML = message;

		});
	</script>
	<!-- -------------------------------------------------------------------------- -->
</section>
<%@ include file="../views/common/footer.jsp" %>
</body>
<script>
	$(document).ready(function() {

	})// ~~ end
</script>
</html>