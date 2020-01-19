<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>어드민페이지</title>


	
<link href="/resources/vendor1/datatables/jquer.dataTables.js" rel="stylesheet" type="text/html">

<link href="/resources/vendor1/datatables/jquer.dataTables.min.js" rel="stylesheet" type="text/html">
  <!-- Custom fonts for this template-->
  <link href="/resources/vendor1/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="/resources/vendor1/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
    <link href="/resources/css1/sb-admin.css" rel="stylesheet">
    

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="/">유저페이지로</a>
	<a class="navbar-brand mr-1" href="#">/</a>
	<span><a class="navbar-brand mr-1" href="/admin">관리자메인</a></span>
   
    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>


<!-- 
    Navbar Search
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

 -->


    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
     
      <li class="nav-item dropdown no-arrow mx-1">
       
      </li>
      <li class="nav-item dropdown no-arrow">
       
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
         
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="/customLogout">로그아웃</a>
        </div>
      
      </li>
    </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      
      <li class="nav-item active">
         <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>상품관리</span></a>
           <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="/admin/Reg">상품등록</a>
          <a class="dropdown-item" href="/admin/RegList">상품 목록</a>
          <a class="dropdown-item" href="/admin/shop/allReply">상품 덧글 관리</a>
     <!--     <a class="dropdown-item" href="#">메인진열 관리</a>	 -->
        </div>
      </li>
      
      <li class="nav-item">
         <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-table"></i>
          <span>주문관리</span></a>
           <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="/admin/shop/orderList">전체주문목록</a>
          <a class="dropdown-item" href="/admin/shop/orderTek">취소/환불</a>
         
        </div>
      </li>
      
      <li class="nav-item">
        	<a class="nav-link" href="/admin/memberList">
             <i class="fas fa-fw fa-folder"></i>
          <span>고객관리</span>
        	</a>  
        </li>
      
      
      <li class="nav-item">
        <a class="nav-link dropdown-toggle" href="/admin/list" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           <i class="fas fa-fw fa-chart-area"></i>
          <span>게시판관리</span></a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          
          <a class="dropdown-item" href="/admin/notice/list">공지사항 관리</a>
          <a class="dropdown-item" href="/admin/review/list">고객상품 후기 관리</a>
        
        </div>
      
      </li>
      
      
    </ul>
 <div id="content-wrapper">

      <div class="container-fluid">

</head>
  
  
 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <script
              src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
              integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
              crossorigin="anonymous">
 </script>
 <script src="/resources/vendor1/bootstrap/js/bootstrap.bundle.min.js"></script>
 
  <!-- Core plugin JavaScript-->
  <script src="/resources/vendor1/jquery-easing/jquery.easing.min.js"></script>
 
  <!-- Page level plugin JavaScript-->
 <script src="/resources/vendor1/chart.js/Chart.min.js"></script>
 <script src="/resources/vendor1/datatables/jquery.dataTables.js"></script>
 <script src="/resources/vendor1/datatables/dataTables.bootstrap4.js"></script>
 
  <!-- Custom scripts for all pages-->
	<script src="/resources/js1/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
 <!--  <script src="/resources/js1/demo/datatables-demo.js"></script>
  <script src="/resources/js1/demo/chart-area-demo.js"></script>  -->
  
  
  
  
  



   