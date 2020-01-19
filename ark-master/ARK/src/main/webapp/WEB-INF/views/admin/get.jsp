<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/adminHeader.jsp" %>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">글 읽기</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading"></div>
			<div class="panel-body">


				<div class="form-group">
					게시물번호<input class="form-control" name="bno" readonly="readonly"
						value='<c:out value="${board.bno }"/>'>
				</div>

				<div class="form-group">
					제목<input class="form-control" name="title" readonly="readonly"
						value='<c:out value="${board.title }"/>'>
				</div>


				<div class="form-group">
					내용
					<textarea rows="3" class="form-control" name="content"
						readonly="readonly">
<c:out value="${board.content }" /></textarea>
				</div>
				<div class="form-group">
					작성자<input class="form-control" name="writer" readonly="readonly"
						value='<c:out value="${board.writer }"/>'>
				</div>
				<sec:authentication property="principal" var="pinfo" />

				<sec:authorize access="isAuthenticated()">
					<!-- 인증된 사용자만 허가 -->
					<c:if test="${pinfo.username eq board.writer }">
						<!-- 인증되었으면서 작성자가 본인일때 수정 버튼 표시 -->
						<button data-oper="modify" class="btn btn-warning">
							수정
							<%-- 	<a href="modify?bno=${board.bno } ">수정</a> --%>
						</button>
					</c:if>
				</sec:authorize>

				<button data-oper="list" class="btn btn-info">
					목록
					<!-- <a href="/board/list">목록</a> -->
				</button>

				<form id="operForm" action="/admin/modify" method="get">
					<input type="hidden" id="bno" name="bno" value="${board.bno }" /> <input
						type="hidden" id="amount" name="amount" value="${cri.amount }" />
					<input type="hidden" id="pageNum" name="pageNum"
						value="${cri.pageNum }" /> <input type="hidden" id="keyword"
						name="keyword" value="${cri.keyword }" /> <input type="hidden"
						id="type" name="type" value="${cri.type }" />


				</form>
				<!-- 폼을 생성해서 게시물번호를 숨김 값으로 전달 
					나중에 현재 페이지 번호 , 페이지당 게시물수 , 검색어 , 검색타입 추가예정 -->

			</div>
		</div>
	</div>
</div>


<br />
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">첨부파일</div>

			<div class="panel-body">
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>

		</div>
	</div>
</div>


<!-- 덧글 시작 -->
<br />
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i>Reply
			
			<sec:authorize access="isAuthenticated()">
				<button class="btn btn-primary btn-xs float-right" id="addReplyBtn">new
					reply</button>
					</sec:authorize>
					
					<!-- 로그아웃 상태에서는 글을 읽을 수는 있지만.
					덧글을 추가할 수는 없음. -->
					
			</div>
			<br />
			<div class="panel-body">
				<ul class="chat">
					<li>good</li>
				</ul>
			</div>

			<div class="panel-footer"></div>

		</div>
	</div>
</div>
<!-- 덧글종료 -->



<!-- Modal 추가 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">덧글 창</h4>
			</div>
			<div class="modal-body">

				<div class="form-group">
					<label>덧글</label> <input class="form-control" name="reply"
						value="새 덧글">
				</div>

				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="replyer"
						value="replyer">
				</div>

				<div class="form-group">
					<label>덧글 작성일</label> <input class="form-control" name="replyDate"
						value="">
				</div>

			</div>

			<div class="modal-footer">
				<button id="modalModBtn" type="button" class="btn btn-warning">수정</button>
				<button id="modalRemoveBtn" type="button" class="btn btn-danger">삭제</button>

				<button id="modalRegisterBtn" type="button" class="btn btn-primary">등록</button>
				<button id="modalCloseBtn" type="button" class="btn btn-default">닫기</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript" src="/resources/js/reply.js">
	
</script>

<script type="text/javascript">
	/* $(document).ready(function(){
	 console.log(replyService);
	 //reply.js 에서 만든객체 replyService 호출
	 // replyService.add(reply,callback) 이런식으로 호출.
	 });
	 */

	/*  console.log("======");
	 console.log("js test");
	
	
	
	 replyService.add( // reply,                        callback,             error
	 {reply:"js test",replyer:"tester",bno:bnoValue},function(result){
	 alert("result:" +result);
	 }); */
	//게시물을 읽을때 자동으로 댓글 1개 등록.
	/*
	
	replyService.getList({bno:bnoValue,page:1}, function(list){
	 for(var i=0, len=list.length || 0; i<len;i++){
		 console.log(list[i]);
	 }
	}); */

	/*  ----
	 replyService.remove(8,function(count){
	 console.log(count);
	 if(count==="success"){
	 alert("removed");
	 }
	 },function(err){
	 alert("error");
	 }); */

	/*  replyService.update({rno:7,
	 bno:bnoValue,
	 reply:"ajax modify"},
	 function(result){
	 alert(result);
	 }); */
	/* 
	 replyService.get(7,function(data){
		 console.log(data);
	 })
	 */

	$(document).ready(
					function() {
						var bnoValue = '<c:out value="${board.bno}"/>';
						var replyUL = $(".chat");
						// reply Unorderd List
						
						var replyer=null;
						<sec:authorize access="isAuthenticated()">
						replyer='<sec:authentication property="principal.username"/>';
						</sec:authorize>
						
						showList(1);

						function showList(page) {
							replyService
									.getList(
											{
												bno : bnoValue,
												page : page || 1
											},
											function(replyCnt, list) {
												console.log("replyCnt : "
														+ replyCnt);

												if (page == -1) {
													// 페이지 번호가 음수 값 이라면,
													pageNum = Math
															.ceil(replyCnt / 10.0);

													//덧글의 마지막 페이지 구하기
													showList(pageNum);
													// 덧글 목록 새로고침 (갱신)
													return;
												}

												var str = "";
												if (list == null
														|| list.length == 0) {
													replyUL.html("");
													
													return;

												}

												for (var i = 0, len = list.length || 0; i < len; i++) {
													// console.log(list[i]);
													str += "<li class='left ";
						str+="clearfix' data-rno='";
						str+=list[i].rno+"'>";
													str += "<div><div class='header' ";
						str+="><strong class='";
						str+="primary-font'>";
													str += list[i].replyer
															+ "</strong>";
													str += "<small class='float-sm-right '>";
													//str+="text-muted'>";
													str += replyService
															.displayTime(list[i].replyDate)
															+ "</small></div>";
													str += "<p>"
															+ list[i].reply;
													str += "</p></div></li>";

												}
												replyUL.html(str);
												showReplyPage(replyCnt);
											});
						} // end_showlist 

						var pageNum = 1;
						var replyPageFooter = $(".panel-footer");
						//.panel-footer

						function showReplyPage(replyCnt) {
							var endNum = Math.ceil(pageNum / 10.0) * 10;
							var startNum = endNum - 9;
							var prev = startNum != 1;
							var next = false;

							console.log("endNum :" + endNum);
							console.log("startNum :" + startNum);

							if (endNum * 10 >= replyCnt) {
								endNum = Math.ceil(replyCnt / 10.0);
							}
							if (endNum * 10 < replyCnt) {
								next = true;
							}

							var str = "<ul class='pagination"; 
				str+=" justify-content-center'>";

							if (prev) {
								str += "<li class='page-item'><a ";
								str += "class='page-link' href='";
								str += (startNum - 1);
								str += "'>이전</a></li>";
							}

							for (var i = startNum; i <= endNum; i++) {
								var active = pageNum == i ? "active" : "";
								str += "<li class='page-item ";
					str+=active+"'><a class='page-link' ";
					str+="href='"+i+"'>"
										+ i + "</a></li>";
							}

							if (next) {
								str += "<li class='page-item'>";
								str += "<a class='page-link' href='";
								str += (endNum + 1) + "'>다음</a></li>";
							}

							str += "</ul>";
							console.log(str);
							replyPageFooter.html(str);
						}

						replyPageFooter.on("click", "li a", function(e) {
							e.preventDefault();
							var targetPageNum = $(this).attr("href");
							pageNum = targetPageNum;
							showList(pageNum);
						});

						var modal = $("#myModal"); // 덧글 용 모달.
						var modalInputReply = modal.find("input[name='reply']");
						// 모달에 입력되는 내용을 조작하기 위해서 변수로 선언.
						var modalInputReplyer = modal
								.find("input[name='replyer']");
						var modalInputReplyDate = modal
								.find("input[name='replyDate']");

						var modalModBtn = $("#modalModBtn");
						var modalRemoveBtn = $("#modalRemoveBtn");
						var modalRegisterBtn = $("#modalRegisterBtn");
						// 모달창 각 버튼도 변수 선언 및 할당.

						$("#modalCloseBtn").on("click", function(e) {
							modal.modal("hide");
							// 모달 닫기 라는 버튼을 클릭한다면 모달창을 숨김.
						});

						$("#addReplyBtn").on("click", function(e) {
							// 덧글 쓰기 버튼을 클릭한다면,
							modal.find("input").val("");
							// 모달의 모든 입력창을 초기화
							
							modal.find("input[name='replyer']").val(replyer);
							modal.find("input[name='replyer']").attr("readonly","readonly");
							
							
							modalInputReplyDate.closest("div").hide();
							// closest : 선택 요소와 가장 가까운 요소를 지정.
							// 즉, modalInputReplyDate 요소의 가장 가까운
							// div를 찾아서 숨김. (날짜창 숨김)
							modal.find("button[id != 'modalCloseBtn']").hide();
							// 모달창에 버튼이 4개 인데, 닫기 버튼을 제외하고 숨기기.

							modalRegisterBtn.show(); // 등록 버튼은 보여라.
							$("#myModal").modal("show");// 모달 표시.
						});
						
						$(document).ajaxSend(function(e,xhr,options){
							xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
						}); // csrf 값을 미리 설정해 두고, ajax 처리시마다 이용,
						
						modalRegisterBtn.on("click", function(e) {
							// 덧글 등록 버튼을 눌렀다면
							var reply = {
								reply : modalInputReply.val(),
								replyer : modalInputReplyer.val(),
								bno : bnoValue
							}; // ajax로 전달할 reply 객체 선언 및 할당.
							replyService.add(reply, function(result) {
								alert(result);
								//ajax 처리후 결과 리턴

								modal.find("input").val(""); // 모달창 초기화
								modal.modal("hide"); // 모달창 숨기기

								modalInputReplyDate.closest("div").show();
								//등록후 댓글 확인할때 날짜표시 

								//showList(1); // 덧글 목록 갱신.
								showList(-1);
								//목록 자동 새로고침
							})

						});

						$(".chat")
								.on(
										"click",
										"li",
										function(e) {
											// 클래스 chat 을 클릭하는데.하위 요소가li 라면
											var rno = $(this).data("rno");

											//덧글에 포함된 값들 중에서 rno 를 추출하여 변수할당
											console.log(rno);
											//콘솔 출력

											replyService
													.get(
															rno,
															function(reply) {
																modalInputReply
																		.val(reply.reply);
																modalInputReplyer
																		.val(reply.replyer)
																modalInputReplyDate
																		.val(
																				replyService
																						.displayTime(reply.replyDate))
																		.attr(
																				"readonly",
																				"readonly");
																// 댓글 목록의 값들을 모달창에 할당.

																modal
																		.data(
																				"rno",
																				reply.rno);
																modal
																		.find(
																				"button[id != 'modalCloseBtn']")
																		.hide();
																modalModBtn
																		.show();
																modalRemoveBtn
																		.show();
																// 버튼 보이기 설정	
																$('#myModal')
																		.modal(
																				"show");
															});

										});

						modalModBtn.on("click", function(e) {
							var originalReplyer = modalInputReplyer.val();
							var reply = {
								rno : modal.data("rno"),
								reply : modalInputReply.val(),
								replyer : originalReplyer
							};
							if(!replyer){
								alert("로그인후 수정 가능");
								modal.modal("hide");
								return;
							}
							
							if(replyer != originalReplyer){
								alert("자신이 작성한 댓글만 수정 가능");
								modal.modal("hide");
								return;
							}
							
							replyService.update(reply, function(result) {
								alert(result);
								modal.modal("hide");
								showList(pageNum);
							});
						}); //end_수정처리

						modalRemoveBtn.on("click", function(e) {
							var rno = modal.data("rno");
								
							
							console.log("replyer" + replyer)
							if(!replyer){
								alert("로그인후 삭제가능")
								modal.modal("hide");
								return;
							}
							
							var originalReplyer = modalInputReplyer.val();
							
						
							if(replyer != originalReplyer){
								alert("자신이 작성한 댓글만 삭제가능");
								modl.modal("hide");
								return;
							}
							
							
							replyService.remove(rno, originalReplyer,function(result) {
								alert(result);
								modal.modal("hide");
								showList(pageNum);
							});
						});// end_삭제처리 		
						
						var csrfHeaderName="${_csrf.headerName}";
						var csrfTokenValue="${_csrf.token}";
						
					}); //end_ready
</script>


<script>
	$(document).ready(function() {
		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/admin/modify").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#bno").remove();
			operForm.attr("action", "/admin/list");
			operForm.submit();
		});
		/* 폼에서 어떤 버튼이 눌렸는지 확인하여
		액션을 변경하거나, 일부 값을 삭제하여 전송.*/
	});
</script>


<script>
	$(document).ready(
			function() {
			(function() {
				// 게시물에 첨부된 파일을 보여주는 부분
				var bno = '<c:out value="${board.bno}"/>';
				//화면상에 공유된 bno 값 가져와 사용준비
				$.getJSON("/admin/getAttachList",
					{bno : bno},
					function(arr) {
					console.log(arr);
					var str = "";
					$(arr).each(function(i,attach) {
						str += "<li data-path='";
						str+=attach.uploadPath+"' data-uuid='";
						str+=attach.uuid+"' data-filename='";
						str+=attach.fileName+"' data-type='";
						str+=attach.fileType+"'><div>";
						str += "<img src='/resources/img/다운로드.png'>";
						str += "<span>"+ attach.fileName+ "</span><br/> ";
						str += "</div></li>"; 
						});
					$(".uploadResult ul").html(str);
					});
				})();
						//bno를 전달하여 콘트롤러에서 처리후, 첨부파일 목록을 콘솔에 출력

						$(".uploadResult").on("click","li",function(e) {
									console.log("download file");
									var liObj = $(this);
									var path = encodeURIComponent(liObj
											.data("path")
											+ "/"
											+ liObj.data("uuid")
											+ "_"
											+ liObj.data("filename"));
									self.location = "/download?fileName="
											+ path;
								});

					});
</script>

<%@ include file="../includes/adminFooter.jsp" %>
