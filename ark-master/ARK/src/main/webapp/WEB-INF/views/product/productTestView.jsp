<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->
<style>
table.table-RelProduct{
	border-spacing:20px;
	border-collapse:separate; 
}

table.table-RelProduct td{
	text-align: center;
}

img.img-RelProduct{
	width:150px;
	height:150px;
}

div.viewMainImg{
  margin-left: 20px;
  padding-right:20px; 
  float: left;
  left:30px;
  text-align: left;
}

div.viewMainSet{
	display : block;
	text-align: left;
	margin-left:100px; 
}
.viewMainImg, .viewMainSet{

}
.viewMainInfo{

}


</style>
<%@ include file="../includes/header.jsp"%>

<div id="page">
	<%@ include file="../includes/aside.jsp"%>
	
	<article id="article">
		
		<div class="viewMain">
			<!-- 상품 이미지 -->
			<div class="viewMainImg">
					<img src="#" width="500px" height="500px">
			</div>
			
			<!-- 상품 구매 리스트 -->
			<div class="viewMainSet">
				<table class="table-viewMainSet">
				<tr class="proname">
					<td>상품이름:</td>
					<td></td>
				</tr>

				<tr class="catecode">
					<td>카테고리:</td>
					<td></td>
				</tr>

				<tr class="gdsPrice">
					<td>판매가격:</td>
					<td><fmt:formatNumber pattern="###,###,###" value="0" />원<td>
				</tr>

				<tr class="cartStock">
					<td>남은수량:</td> 
					<td>개</td>
				</tr>
				<tr class="Stock">
					<td>구매수량:</td> 
					<td><input type="number" min="1" max="999" style="width:50px;" 
						value="1" size="1" required />개
						<span>/</span>
						
						</td>
				</tr>
				</table>
				<br /> <br />
				<button type="button">구매</button>
				<button type="button">장바구니</button>
				<button type="button">찜하기</button>
			</div>
	
			<div class="viewMainInfo">
			상품주문
			</div>
				</div>
		


<table class="table-RelProduct">
	<tbody>
		<tr>
			<td >

				<div>
					<a href="#"><img src="" class="img-RelProduct"></a>
				</div>
				<div style="padding: 5">
					<a href="#">관련된 상품</a>
				</div>
				<div>
					<b>가격</b>
				</div>
				<div style="padding: 5">
					<img src=""> <img src=""> <img src="">
				</div>
			</td>
			<td >

				<div>
					<a href="#"><img src="" class="img-RelProduct"> </a>
				</div>
				<div style="padding: 5">
					<a href="#">관련된 상품</a>
				</div>
				<div>
					<b>가격</b>
				</div>
				<div style="padding: 5">
					<img src=""> <img src=""> <img src="">
				</div>
			</td>
			<td >

				<div>
					<a href="#"><img src="" class="img-RelProduct"></a>
				</div>
				<div style="padding: 5">
					<a href="#">관련된 상품</a>
				</div>
				<div>
					<b>가격</b>
				</div>
				<div style="padding: 5">
					<img src=""> <img src=""> <img src="">
				</div>
			</td>
			<td >

				<div>
					<a href="#"><img src="" class="img-RelProduct"></a>
				</div>
				<div style="padding: 5">
					<a href="#">관련된 상품</a>
				</div>
				<div>
					<b>가격</b>
				</div>
				<div style="padding: 5">
					<img src=""> <img src=""> <img src="">
				</div>
			</td>
			<td >

				<div>
					<a href="#"><img src="" class="img-RelProduct"></a>
				</div>
				<div style="padding: 5">
					<a href="#">관련된 상품</a>
				</div>
				<div>
					<b>가격</b>
				</div>
				<div style="padding: 5">
					<img src="" alt="인기 표시"> <img src="핫딜 표시"> <img src="세일 표시">
				</div>
			</td>
		</tr>
	</tbody>
</table>

</article>
</div>
<%@ include file="../includes/footer.jsp"%>


<script type="text/javascript">

</script>
