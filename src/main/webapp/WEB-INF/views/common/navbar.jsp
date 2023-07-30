<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

    @import url('https://fonts.googleapis.com/css?family=Averia+Serif+Libre|Bubblegum+Sans|Caveat+Brush|Chewy|Lobster+Two');

    .nav_main {
        width: 100%;
        height: 10%;
    }
    .navbar {
        border: 0;
        z-index: 9999;
        letter-spacing: 4px;
    }
    .logo {
        display: block;
        height: auto;
        width: 52px;
        padding-top: 5px;
        margin-right: 15px;
    }

    .navbar-brand>img {
        height: 100%;
        padding: 15px;
        width: auto;
    }
    .navbar .nav > li > a {
        line-height: 50px;
    }

    .navbar-header h1 {
        letter-spacing: 1px;
        color: black !important;
        font-family: 'Lobster Two', cursive !important;
    }

    .navbar li a, .navbar {
        color: black !important;
        font-size: 12px;
        transition: all 0.6s 0s;
    }

    .navbar-toggle {
        background-color: transparent !important;
        border: 0;
    }

    .navbar-nav li a:hover, .navbar-nav li.active a {
        color: red !important;
    }

    @font-face {
        font-family: 'Jal_Onuel';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    section {
    	font-family: 'Jal_Onuel';
        height: auto;
        min-height: 74%;
        /*padding-bottom: 150px;*/
    }

    * {
        margin: 0px;
        padding: 0px;
        text-decoration: none;
        list-style: none;
    }
    a {
        color: black;
        text-decoration: none;
    }

    .content-wrapper iframe {
        width: 100%;
        min-height: 500px;
    }

</style>

<head>
    <meta charset="UTF-8">
    <title> Cafap </title>
    <meta name="description" content="Cafap">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!--  애니메이트 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" integrity="sha512-c42qTSw/wPZ3/5LBzD+Bw5f7bSF2oxou6wEb+I/lqeaKV5FDIfMvvRp772y4jcJLKuGUOpbJMdg/BTl50fJYAw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- 스윗모달 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!--  오토 사이즈 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/autosize.js/6.0.1/autosize.min.js" integrity="sha512-OjjaC+tijryqhyPqy7jWSPCRj7fcosu1zreTX1k+OWSwu6uSqLLQ2kxaqL9UpR7xFaPsCwhMf1bQABw2rCxMbg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- 써머노트 (위지위그) -->
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/webapp/resources/summerNote/summernote-lite.min.css" />--%>
<%--    <script src="${pageContext.request.contextPath}/webapp/resources/summerNote/summernote-lite.min.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/webapp/resources/summerNote/lang/summernote-ko-KR.min.js"></script>--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<div class="nav_main">
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container" style="width: 95%">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#myNavbar">
                <span class="glyphicon glyphicon-menu-hamburger"></span>
            </button>
            <a href="home">
            <div class="navbar-left logo">
                <img src="../../resources/imgs/cafap_logo.png" width="80px" height="80px">
            </div>
            <h1 class="brand brand-name navbar-left"><div class="navbar-left" style="margin-left: 20px">Cafap</h1>
            </a>
        </div>
        <div class="collapse navbar-collapse navbar-right" style="font-family: 'Jal_Onuel';" id="myNavbar">
            <ul class="nav navbar-nav">
                <li><a href="home" style="font-size: x-large;">지도</a></li>
                <c:if test="${not empty userDto}">
                    <li><a href="myMap" style="font-size: x-large;">내지도</a></li>
                </c:if>
                <li><a href="login" style="font-size: x-large;">내정보</a></li>
            </ul>
        </div>
    </div>
</nav>
</div>
