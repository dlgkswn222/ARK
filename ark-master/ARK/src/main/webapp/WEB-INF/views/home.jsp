<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="/resources/css/skel-noscript.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/style2.css" />
<link rel="stylesheet" href="/resources/css/style-desktop.css" />
<link rel="stylesheet" href="/resources/css/fullpage.css" />


<link rel="stylesheet" href="/resources/css/style1.css" />
<link rel="stylesheet" href="/resources/css/jquery.ui.css" />
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" />
<link rel="stylesheet" href="/resources/css/swiper.min.css" />


<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="resources/js/fullpage.js"></script>


<%@ include file="includes/header.jsp"%>

<!-- Main -->
<div class="page">
	<div id="fullpage">
		<div class="section section1">
			<div class="slide"
				style="background-image: url(images/main03.jpg); background-size: 100%;"></div>
			<div class="slide"
				style="background-image: url(images/main_banner_02.jpg); background-size: 100%;"></div>
			<div class="slide"
				style="background-image: url(images/main_banner_03.jpg); background-size: 100%;"></div>
		</div>
		<div class="section section2">
			<div class="slide"
				style="background-image: url(images/main_banner_02.jpg); background-size: 100%;"></div>
		</div>
		<div class="section section3">
			<div class="slide"
				style="background-image: url(images/main_banner_03.jpg); background-size: 100%;"></div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$('#fullpage').fullpage({
			autoScrolling : true,
			scrollHorizontally : true,
			navigation : true
		});
	})
</script>


<%@ include file="includes/footer.jsp"%>