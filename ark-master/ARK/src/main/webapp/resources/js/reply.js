console.log("Reply module.......");

/*
 * var replyService = (function(){ return{name:"aaaa"}; // replyService 변수선언. //
 * 내부에는 함수가 있고, name:"aaaa" 를 리턴. })(); //즉시 실행항수, 예) var a = new a();
 */


/*
 * var replyService = (function(){ function add(reply,callback){
 * console.log("reply......") }
 * 
 * 
 * return{add:add};
 * 
 * })();
 */


var replyService = (function() {function add(reply, callback, error) {
		console.log("add reply......");
		// 설정
		$.ajax({
			type : 'GET',
			url : '/replies/new',
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


	function getList(param,callback,error){
var bno=param.bno;
var page= param.page || 1;
// 페이지 번호가 있으면 페이지 번호 전달 없으면 1전달.

$.getJSON("/replies/pages/"+bno+"/"+page+".json",function(data){
if(callback){
	//callback(data);
	callback(data.replyCnt,data.list);
}	
}).fail(function(xhr,status,err){
	// xhr: xm;l http request 의 약자
	// 현재는 사용되지 않고 형식만 맞춰줌.
	
	if(error){
		error(er);
	}
})
}

	function remove(rno,replyer,callback,error){
		$.ajax({
			type:'delete',
			url:'/replies/'+rno,
			
			data:JSON.stringify({rno:rno,replyer:replyer}),
			contentType: "application/json; charset=utf-8",
			
			success:function(deleteResult,status,xhr){
				if(callback){
					callback(deleteResult);
				}
			},error:function(xhr,status,er){
				if(error){
				error(er);
				}
			}
		})
	}
	
	
	 
	
	function update(reply,callback,error){
		console.log("rno: " +reply.rno);
		
	$.ajax({
		type:'put',
		url:'/replies/'+reply.rno,
		data:JSON.stringify(reply),
		contentType: "application/json;charset=utf-8",
		success: function(result,status,xhr){
			if(callback){
				callback(result);
				
			}
		},
		error:function(xhr,status,er){
			if(error){
				error(er);
			}
		}
	})
		
		
}


	function get(rno,callback,error){
		$.get("/replies/"+rno+".json",function(result){
			if(callback){
			callback(result);	
			}
		}).fail(function(xhr,status,er){
			if(error){
				error(er);
			}
		})	
	}
	
	function displayTime(timeValue){
		var today=new Date();// 현재 시간
		
		var gap = today.getTime() - timeValue;
		// 시간차이 연산.
	
		var dateObj = new Date(timeValue);
		// 덧글이 등록된 시간을 변수에 할당..
		var str="";
		
		if(gap<(1000*60*60*24)){ 
			// 시간차이가 24시간 초과라면,
			var hh=dateObj.getHours();
			var mi=dateObj.getMinutes();
			var ss=dateObj.getSeconds();
			
			return [ (hh>9?'':'0')+hh, ':'
				,(mi>9?'':'0')+mi
				,':',(ss>9?'':'0')+ss].join('');
			// 배열 요소를 문자열로 변환.
			// 시간에 포맷을 맞추기 위해서
			// 0~9까지는 앞에 0을 추가 표시.
		}else{
			var yy=dateObj.getFullYear();
			var mm=dateObj.getMonth()+1;
			var dd=dateObj.getDate();
			
			return [yy,'/', (mm>9?'':'0')+mm,'/',
				(dd>9?'':'0')+dd].join('');
		}
	}
	
	

	
	return {
		add : add,
		getList : getList,
		remove: remove,
		update:update,
		get:get,
		displayTime:displayTime
	};
})();