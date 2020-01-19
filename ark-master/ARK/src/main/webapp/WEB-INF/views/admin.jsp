<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/adminHeader.jsp"%>
    <link href="/resources/css/jquery-ui.css" rel="stylesheet">
	<link href="/resources/css/swiper.min.css" rel="stylesheet" media="screen">
	<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<style>
.pet-info-popup {
	width: 210px;
}

.presale-wrap h3.title-presale {
	margin-top: 20px;
	margin-bottom: 10px;
	font-size: 22px;
	font-weight: bold;
	color: #2e2a28;
}

.presale-wrap .list-presale, body .wrap .content .presale-wrap .pet-record-wrap .pet-blog-content .list-photos,
	body .wrap .content .pet-record-wrap .pet-blog-content .presale-wrap .list-photos
	{
	width: 100%;
	overflow: hidden;
}

.presale-wrap .list-presale dl, body .wrap .content .presale-wrap .pet-record-wrap .pet-blog-content .list-photos dl,
	body .wrap .content .pet-record-wrap .pet-blog-content .presale-wrap .list-photos dl
	{
	height: 318px;
}

.presale-wrap .list-presale dl:nth-child(5n+1), body .wrap .content .presale-wrap .pet-record-wrap .pet-blog-content .list-photos dl:nth-child(5n+1),
	body .wrap .content .pet-record-wrap .pet-blog-content .presale-wrap .list-photos dl:nth-child(5n+1)
	{
	margin-left: 0;
}

.presale-wrap .list-presale dl:nth-child(-n+6), body .wrap .content .presale-wrap .pet-record-wrap .pet-blog-content .list-photos dl:nth-child(-n+6),
	body .wrap .content .pet-record-wrap .pet-blog-content .presale-wrap .list-photos dl:nth-child(-n+6)
	{
	margin-top: 0;
}

.presale-wrap .list-presale dl:nth-child(n+6), body .wrap .content .presale-wrap .pet-record-wrap .pet-blog-content .list-photos dl:nth-child(n+6),
	body .wrap .content .pet-record-wrap .pet-blog-content .presale-wrap .list-photos dl:nth-child(n+6)
	{
	margin-top: 10px;
}

.presale-wrap .mating-list dl {
	height: 384px;
}

.presale-wrap .mating-list dl dd:nth-last-of-type(2) {
	border: none;
	padding: 0 0 0 20px;
}

.presale-wrap .mating-list dl dd:nth-last-of-type(1) {
	border-top: 1px solid #dadada;
	padding: 10px 0 5px 20px;
}

.presale-wrap .mating-list dl dd:nth-last-of-type(1) .ico-progress {
	padding: 1px 10px 3px 10px;
	background: #f97d23;
	font-size: 15px;
	font-weight: normal;
	color: #fff;
}

.presale-wrap .mating-list dl dd:nth-last-of-type(1) .ico-end {
	padding: 1px 10px 3px 10px;
	background: #9a9a9a;
	font-size: 15px;
	font-weight: normal;
	color: #fff;
}

.widget-gallery dl {
	margin-top: 18px;
	padding-bottom: 18px;
	border: 1px solid #dadada;
}

.widget-gallery dl dt {
	width: 100%;
	margin-bottom: 15px;
}

.widget-gallery dl dt img {
	width: 100%;
}

.widget-gallery dl dd {
	padding: 0 18px;
	font-size: 14px;
	font-weight: bold;
	color: #666;
}

.widget-gallery {
	float: left;
	width: 208px;
	height: 80%;
	border: 1px solid #dadada;
}

.widget-gallery dt {
	width: 206px;
	height: 206px;
}

.widget-gallery dt img {
	border-bottom: 1px solid #dadada;
}

.widget-gallery dd {
	padding-left: 5px;
	font-size: 13px;
	font-weight: bold;
	color: #777;
}

.widget-gallery dd:nth-of-type(1) {
	margin-top: 6px;
	font-size: 14px;
	font-weight: bold;
	color: #fa9042;
}

.widget-gallery dd:last-child span {
	color: #fa9042;
}

.list-presale dl dt img, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl dt img, body .wrap .header img, body .wrap .content .patners-wrap .list-patners-main dl dt img, body .wrap .content .patners-wrap .list-patners-info dl dt img {
  display: block;
}

.list-presale, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos {
  width: 666px;
  float: left;
}

.list-presale dl a, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl a {
  color: #666;
}

.list-presale dl dt, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl dt {
  border-bottom: 1px solid #dadada;
}

.list-presale dl dt, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl dt {
  border-bottom: 1px solid #dadada;
}

.list-presale dl dd, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl dd {
  font-size: 15px;
  padding-left: 19px;
}

.list-presale dl dd:nth-of-type(1), body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl dd:nth-of-type(1) {
  padding-top: 5px;
}

.list-presale dl dd:nth-last-of-type(2), body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl dd:nth-last-of-type(2) {
  border-top: 1px solid #dadada;
  padding: 6px 0 6px 20px;
}

.list-presale dl dd:nth-last-of-type(2) .ico-progress, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl dd:nth-last-of-type(2) .ico-progress {
  padding: 1px 10px 3px 10px;
  background: #f97d23;
  font-size: 15px;
  font-weight: normal;
  color: #fff;
}

.list-presale dl dd:nth-last-of-type(2) .ico-end, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl dd:nth-last-of-type(2) .ico-end {
  padding: 1px 10px 3px 10px;
  background: #9a9a9a;
  font-size: 15px;
  font-weight: normal;
  color: #fff;
}

.list-presale dl dd:nth-last-of-type(1), body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl dd:nth-last-of-type(1) {
  font-size: 14px;
  padding-left: 20px;
}

.list-presale dl:nth-child(n+4), body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl:nth-child(n+4) {
  margin-top: 10px;
}

.list-presale dl .sell-amt, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl .sell-amt {
  height: 24px;
  font-size: 16px;
  font-weight: bold;
  color: #f97d23;
}

.list-presale, body .wrap .content .presale-wrap .pet-record-wrap .pet-blog-content .list-photos, body .wrap .content .pet-record-wrap .pet-blog-content .presale-wrap .list-photos {
  width: 100%;
  overflow: hidden;
}

.list-presale dl, body .wrap .content .presale-wrap .pet-record-wrap .pet-blog-content .list-photos dl, body .wrap .content .pet-record-wrap .pet-blog-content .presale-wrap .list-photos dl {
  height: 318px;
}

.list-presale dl:nth-child(5n+1), body .wrap .content .presale-wrap .pet-record-wrap .pet-blog-content .list-photos dl:nth-child(5n+1), body .wrap .content .pet-record-wrap .pet-blog-content .presale-wrap .list-photos dl:nth-child(5n+1) {
  margin-left: 0;
}

.list-presale dl:nth-child(-n+6), body .wrap .content .presale-wrap .pet-record-wrap .pet-blog-content .list-photos dl:nth-child(-n+6), body .wrap .content .pet-record-wrap .pet-blog-content .presale-wrap .list-photos dl:nth-child(-n+6) {
  margin-top: 0;
}

.list-presale dl:nth-child(n+6), body .wrap .content .presale-wrap .pet-record-wrap .pet-blog-content .list-photos dl:nth-child(n+6), body .wrap .content .pet-record-wrap .pet-blog-content .presale-wrap .list-photos dl:nth-child(n+6) {
  margin-top: 10px;
}

.list-presale{
    width:100%!important;
}

.list-presale dl:nth-child(n){
    margin-top:30px!important;
}

.list-presale dl{
    margin-left:10px!important;
  
}

.list-presale dl dt img, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl dt img, body .wrap .header img, body .wrap .content .patners-wrap .list-patners-main dl dt img, body .wrap .content .patners-wrap .list-patners-info dl dt img {
  display: block;
}

.list-presale, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos {
  width: 666px;
  float: left;
}

.list-presale dl, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl {
  min-height: 297px;
  overflow: hidden;
  margin-left: 12px;
  float: left;
  border: 1px solid #dadada;
  color: #666;
}

.list-presale dl a, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl a {
  color: #666;
}

.list-presale dl dt, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl dt {
  border-bottom: 1px solid #dadada;
}

.list-presale dl dd, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl dd {
  font-size: 15px;
  padding-left: 19px;
}

.list-presale dl dd:nth-of-type(1), body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl dd:nth-of-type(1) {
  padding-top: 5px;
}

.list-presale dl dd:nth-last-of-type(2), body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl dd:nth-last-of-type(2) {
  border-top: 1px solid #dadada;
  padding: 6px 0 6px 20px;
}

.list-presale dl dd:nth-last-of-type(2) .ico-progress, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl dd:nth-last-of-type(2) .ico-progress {
  padding: 1px 10px 3px 10px;
  background: #f97d23;
  font-size: 15px;
  font-weight: normal;
  color: #fff;
}

.list-presale dl dd:nth-last-of-type(2) .ico-end, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl dd:nth-last-of-type(2) .ico-end {
  padding: 1px 10px 3px 10px;
  background: #9a9a9a;
  font-size: 15px;
  font-weight: normal;
  color: #fff;
}

.list-presale dl dd:nth-last-of-type(1), body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl dd:nth-last-of-type(1) {
  font-size: 14px;
  padding-left: 20px;
}
.list-presale dl:nth-child(n+4), body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl:nth-child(n+4) {
  margin-top: 10px;
}

.list-presale dl .sell-amt, body .wrap .content .pet-record-wrap .pet-blog-content .list-photos dl .sell-amt {
  height: 24px;
  font-size: 16px;
  font-weight: bold;
  color: #f97d23;
}

.list-presale, body .wrap .content .presale-wrap .pet-record-wrap .pet-blog-content .list-photos, body .wrap .content .pet-record-wrap .pet-blog-content .presale-wrap .list-photos {
  width: 100%;
  overflow: hidden;
}

.list-presale dl, body .wrap .content .presale-wrap .pet-record-wrap .pet-blog-content .list-photos dl, body .wrap .content .pet-record-wrap .pet-blog-content .presale-wrap .list-photos dl {
  height: 318px;
}

.list-presale dl:nth-child(5n+1), body .wrap .content .presale-wrap .pet-record-wrap .pet-blog-content .list-photos dl:nth-child(5n+1), body .wrap .content .pet-record-wrap .pet-blog-content .presale-wrap .list-photos dl:nth-child(5n+1) {
  margin-left: 0;
}

.list-presale dl:nth-child(-n+6), body .wrap .content .presale-wrap .pet-record-wrap .pet-blog-content .list-photos dl:nth-child(-n+6), body .wrap .content .pet-record-wrap .pet-blog-content .presale-wrap .list-photos dl:nth-child(-n+6) {
  margin-top: 0;
}

.list-presale dl:nth-child(n+6), body .wrap .content .presale-wrap .pet-record-wrap .pet-blog-content .list-photos dl:nth-child(n+6), body .wrap .content .pet-record-wrap .pet-blog-content .presale-wrap .list-photos dl:nth-child(n+6) {
  margin-top: 10px;
}

.list-presale{
    width:100%!important;
}

.list-presale dl:nth-child(n){
    margin-top:30px!important;
}

.list-presale dl{
    margin-left:10px!important;
  
}
/* 페이징 */




</style>
<div class="presale-wrap">
	<div class="list-presale widget-gallery" id="pet-list">
	
	<c:forEach items="${goodsList}" var="list">
		<dl class="pet-info-popup" data-method="2427">
			
			<a href="/admin/goods/view?gdsNum=${list.gdsNum}">

				<dt class="widget-img">
					<img style="height: 206px;" src="/resources/images/upload${list.gdsThumbImg}">
				</dt>
				<dd>${list.gdsName}</dd>
				
				<dd>${list.cateName}</dd>
				<c:choose>
				<c:when test="${list.gdsStock > 0 }">
				
				<dd>
					판매중
				</dd>
				</c:when>
				<c:otherwise>
				<dd>
					수량부족
				</dd>
				</c:otherwise>
				
				
				</c:choose>
				<dd></dd>
			</a>
		
		</dl>
		</c:forEach>
		
		
	</div>
</div>



					<form id="searchForm" action="/admin" method="get">
					&nbsp;&nbsp;&nbsp;<select name="type">
							<option value="" ${pageMaker.cri.type==null?"selected":"" }>
								--</option>
							<option value="T" ${pageMaker.cri.type eq "T"?"selected":"" }>
								이름</option>
								
							<option value="C" ${pageMaker.cri.type eq "C"?"selected":"" }>
								카테고리</option>
								
							
								
						</select> <input type="text" name="keyword" />
						<input type="hidden"name="pageNum" value="${pageMaker.cri.pageNum }"> 
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<button class="btn btn-warning">선택</button>
					</form>
			




		
			<div>
				<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.prev }">
						<li class="page-item previous"><a
							href="${pageMaker.startPage-1 }" class="page-link">prev</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<li class='page-item ${pageMaker.cri.pageNum==num?"active":"" }'>
							<a href="${num }" class="page-link"> ${num }</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next }">
						<li class="page-item next"><a href="${pageMaker.endPage+1 }"
							class="page-link">next</a></li>
					</c:if>

				</ul>
			</div>
		



<form id="actionForm" action="/admin" method="get">
				<input type="hidden" name="pageNum"
					value="${pageMaker.cri.pageNum }"> <input type="hidden"
					name="amount" value="${pageMaker.cri.amount }">
					<input type="hidden" name="type" 
					value="${pageMaker.cri.type }">
					<input type="hidden" name="keyword" 
					value="${pageMaker.cri.keyword }">
			</form>


<script>
$(document).ready(function() {
var actionForm = $("#actionForm");
// 클래스 page-item 에 a 링크가 클릭 된다면,

$(".page-item a").on(
		"click",
		function(e) {
			e.preventDefault();
			// 기본 이벤트 동작을 막고,
			console.log("click");
			// 웹 브라우저 검사 창에 클릭을 표시
			actionForm.find("input[name='pageNum']").val(
					$(this).attr("href"));
			// 액션폼 인풋태그에 페이지넘 값을 찾아서,
			// href로 받은 값으로 대체함.
			actionForm.submit();
		});
});
</script>

<%@ include file="includes/adminFooter.jsp"%>
