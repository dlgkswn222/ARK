<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }

    ul, ol, li { list-style:none; margin:0; padding:0; }
   
    ul.myMenu {float:left; width:180px;}
    ul.myMenu > li { display:inline-block; width:100px; padding:5px 10px; background:#eee; border:1px solid #eee; text-align:center; position:relative; }
    ul.myMenu > li:hover { background:#fff; }
    ul.myMenu > li ul.submenu { display:none; position:absolute; top:0; left:100px;}
    ul.myMenu > li:hover ul.submenu { display:block; }
    ul.myMenu > li ul.submenu > li { display:inline-block; width:100px; padding:5px 10px; background:#eee; border:1px solid #eee; text-align:center; }
    ul.myMenu > li ul.submenu > li:hover { background:#fff; }


</style>


   
    <h3>상품카테고리</h3>
    




<ul class="myMenu">
    <li class="menu1">무기
    
   <ul class="menu1_s submenu">
    <li><a href="/shop/list?c=101&l=2">돌격소총</a></li>
  	<li><a href="/shop/list?c=102&l=2">기관단총</a></li>
 	<li><a href="/shop/list?c=103&l=2">경기관총</a></li>
    <li><a href="/shop/list?c=104&l=2">산탄총</a></li>
    <li><a href="/shop/list?c=105&l=2">지정사수소총</a></li>
    <li><a href="/shop/list?c=106&l=2">저격소총</a></li>
    <li><a href="/shop/list?c=107&l=2">기타</a></li>
  </ul>
   
    </li>
    
    <li class="menu2">
       양서류
        <ul class="menu2_s submenu">
            <li>메뉴 2-1</li>
            <li>메뉴 2-2</li>
            <li>메뉴 2-3</li>
        </ul>   
    </li>
    
    <li class="menu3">
        절지류
        <ul class="menu3_s submenu">
            <li>메뉴 3-1</li>
            <li>메뉴 3-2</li>
            <li>메뉴 3-3</li>
        </ul>   
    </li>
    <li class="menu4">조류</li>
    <li class="menu5">파충류</li>   
	<li class="menu6">포유류</li>
</ul>



  



  