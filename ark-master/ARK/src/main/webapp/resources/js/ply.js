console.log("Reply module.......");



var replyService = (function() {function add(reply, callback, error) {
	console.log("add reply......");
	// 설정
	$.ajax({
		type : 'post',
		url : '/shop/view/registReply',
		data : JSON.stringify(reply),
		// 가져온 reply 값을 json 타입으로 보내주는것
		contentType : "application/json; charset=utf-8",
		// 성공시
		success : function(result, status, xhr) {
			if (callback) {
				callback(result);
			}
		},
		// 실패시
		error : function(xhr, status, er) {
			if (error) {
				error(er);
			}
		}
	})
}
});

