var Agent = navigator.userAgent.toLowerCase();

var Request = function(url) {

	this.url = (url ? url : location.href);

	this.getParameter = function( name ) {

		var rtnval = '';
		//var nowAddress = unescape(this.url);
		var nowAddress = decodeURIComponent(this.url);
		var parameters = (nowAddress.slice(nowAddress.indexOf('?')+1,nowAddress.length)).split('&');
		for(var i = 0 ; i < parameters.length ; i++)
		{
			var varName = parameters[i].split('=')[0];
			if(varName.toUpperCase() == name.toUpperCase())
			{
				rtnval = parameters[i].split('=')[1];
				break;
			}
		}
		return rtnval;
	};
};

var request = new Request();

//�곷Ц,�レ옄留� �낅젰媛���
jQuery.fn.onlyEngNum = function() {

	this.bind("keypress keydown contextmenu", function(event){

		if (event.type == "keypress") {
			if(!(event.which>=48 && event.which<=57) && !(event.which>=65 && event.which<=90) && !(event.which>=97 && event.which<=122) && event.which!=0 && event.which!=8) {
				event.preventDefault();
			}
		} else if (event.type == "keydown") {
			if ((event.ctrlKey==true && (event.which == '118' || event.which == '86')) || (event.shiftKey==true && event.which == '45')) {
				event.preventDefault();
			}
		} else if (event.type == "contextmenu") {
			event.preventDefault();
		}
	});

	return this;
};

//�レ옄留� �낅젰媛���
jQuery.fn.onlyNum = function() {

	this.css("ime-mode","disabled");

	this.bind("keypress keydown contextmenu", function(event){

		if (event.type == "keypress")
		{
			if(!(event.which>=48 && event.which<=57) && event.which!=0 && event.which!=8) {
				event.preventDefault();
			}
		}
		else if (event.type == "keydown")
		{
			if ((event.ctrlKey==true && (event.which == '118' || event.which == '86')) || (event.shiftKey==true && event.which == '45'))
			{
				event.preventDefault();
			}
		}
		else if (event.type == "contextmenu")
		{
			event.preventDefault();
		}

	});

	return this;
};

jQuery.fn.center = function() {
	this.css("position","absolute");
	this.css("z-index",10001);

	if (this.height() + 50 < $(window).height())
	{
		this.css("top", ($(window).height() - this.height()) / 2 + $(window).scrollTop() + "px");
	}
	else
	{
		this.css("top", ($(window).scrollTop() + 50) + "px");
	}


	this.css("left", ($(window).width() - this.width()) / 2 + $(window).scrollLeft() + "px");
	return this;
};


jQuery.fn.alternateRowColors = function(odd,even,trId) {
	$('tbody '+(trId ? trId : "tr")+':odd', this).removeClass(even).addClass(odd);
	$('tbody '+(trId ? trId : "tr")+':even', this).removeClass(odd).addClass(even);
	return this;
};

var putComma = function(input) {
	var num = input;

	if (num < 0) {
		num *= -1;
		var minus = true
	}else{
		var minus = false
	}

	var dotPos = (num+"").split(".")
	var dotU = dotPos[0]
	var dotD = dotPos[1]
	var commaFlag = dotU.length%3

	if(commaFlag) {
		var out = dotU.substring(0, commaFlag)
		if (dotU.length > 3) out += ","
	}
	else var out = ""

	for (var i=commaFlag; i < dotU.length; i+=3) {
		out += dotU.substring(i, i+3)
		if( i < dotU.length-3) out += ","
	}

	if(minus) out = "-" + out
	if(dotD) return out + "." + dotD
	else return out
}

var addComma = function(amt)
{
	return putComma(amt);
}

var rmComma = function(amt)
{
	return amt.replace(/,/g, "");
}

//�좎쭨諛⑹떇�쇰줈 諛붽퓞.			getDateFormat(20160101,'-') �� 2016-01-01
var getDateFormat = function(d, delim) {
	if (d != "")
	{
		if (d.length == 8)
			return d.substr(0, 4) + delim + d.substr(4, 2) + delim + d.substr(6, 2);
		else if (d.length == 14)
			return d.substr(0, 4) + delim + d.substr(4, 2) + delim + d.substr(6, 2) + " " + d.substr(8, 2) + ":" + d.substr(10, 2) + ":" + d.substr(12, 2);

	}
	else
		return "";
}

//臾몄옄 湲몄씠 �먮Ⅴ湲�.
var cutStr = function(str,limit){
	var tmpStr = str;
	var byte_count = 0;
	var len = str.length;
	var dot = "";

	for(i=0; i<len; i++){
		byte_count += chr_byte(str.charAt(i));
		if(byte_count == limit-1){
			if(chr_byte(str.charAt(i+1)) == 2){
				tmpStr = str.substring(0,i+1);
				dot = "...";
			}
			else
			{
				if(i+2 != len) dot = "...";
				tmpStr = str.substring(0,i+2);
			}
			break;
		}
		else if(byte_count == limit)
		{
			if(i+1 != len) dot = "...";
			tmpStr = str.substring(0,i+1);
			break;
		}
	}
	return tmpStr+dot;
}

//臾몄옄�� �먮Ⅴ湲�
function chr_byte(chr){
	if(escape(chr).length > 4) return 2;
	else
	return 1;
}

//--------------------------------------------------------------------------------------------
//ajax �붿껌
var ajaxRequest = function(url, param, callback, opt) {

	var returnData = "";

	var dataUrl		= url;
	var formdata	= param;
	var cb			= callback;

	if (typeof cb != "function")
	{
		cb = function(data){
			returnData = data;
		}
	}

	var isAsync		= (typeof opt.async != "undefined" ? opt.async : true);
	var method		= (typeof opt.method != "undefined" ? opt.method : "POST");
	var datatype	= (typeof opt.datatype != "undefined" ? opt.datatype : "json");

	$.ajax({
		async: isAsync,
		cache:false,
		type: method,
		url: dataUrl,
		data: formdata,
		dataType: datatype,
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		success: cb,
		error: function(request, status, error) {
			alert(request.responseText);
		}
	});

	if (isAsync == false)
	{
		return returnData;
	}
}


//--------------------------------------------------------------------------------------------

//由ъ뒪�� �먮뒗 �곗씠�� 媛��몄삤�� �⑥닔
var fnGetDataList = function(jsonOpt) {
	ajaxRequest(jsonOpt.url, jsonOpt.data, jsonOpt.callback, jsonOpt);
}

//�쒕쾭�좎쭨/�쒓컙 媛��몄삤湲�
var fnGetDate = function(gn,df,minus){
	var data = ajaxRequest("/server/q_system/getDate.php", "date_gn="+gn+"&df="+df+"&minus="+minus, null, {async:false});
	return data.result;
}

//-----------------------------------------------------------------------------------------------------------------------------------------

//�뚯씠釉� 由ъ뒪�� 珥덇린��
var initTableList = function(tbId) {
	$.each($(tbId + ' > tbody tr, '+ tbId + ' > tfoot tr'), function(index, entry) {
		$(this).remove();
	});
}

//踰꾪듉 �쒖꽦��/鍮꾪솢�깊솕
var initBtnEnabled = function(btnArr) {
	$.each(btnArr, function(btn, val) {
		if (val == true)
			$("#" + btn).removeClass("btnLb1").addClass("btnLb");	//踰꾪듉 �쒖꽦��
		else
			$("#" + btn).removeClass("btnLb").addClass("btnLb1");	//踰꾪듉 鍮꾪솢�깊솕
	});
}

//踰꾪듉(Small) �쒖꽦��/鍮꾪솢�깊솕
var initBtnSbEnabled = function(btnArr) {
	$.each(btnArr, function(btn, val) {
		if (val == true)
			$("#" + btn).removeClass("btnSb1").addClass("btnSb");	//踰꾪듉 �쒖꽦��
		else
			$("#" + btn).removeClass("btnSb").addClass("btnSb1");	//踰꾪듉 鍮꾪솢�깊솕
	});
}

//踰꾪듉(Small) �쒖꽦��/鍮꾪솢�깊솕
var initBtnSbEnabled2 = function(btnArr) {
	$.each(btnArr, function(btn, val) {
		if (val == true) {
			$("#" + btn).removeClass("btnGs1").addClass("btnGs");	//踰꾪듉 �쒖꽦��
		} else {
			$("#" + btn).removeClass("btnGs").addClass("btnGs1");	//踰꾪듉 鍮꾪솢�깊솕
		}
	});
}


//�낅젰�� 珥덇린��
var initInputClear = function(formId) {

	$(formId).find("input:text.clear, input:hidden.clear, textarea.clear, input:password.clear, input:file.clear").each(function(index) {
		$(this).val("");
	});

	//泥댄겕諛뺤뒪 紐⑤몢 �좏깮�댁젣
	$("input:checkbox.clear").attr("checked",false);
	//span �띿뒪�� 吏��곌린
	$(".clear").html("");
	//���됲듃諛뺤뒪 �몃뜳�� 0媛믪쑝濡� �명똿
	$("select.selectclear").find("option:first").attr("selected", "selected");

}

//�낅젰�� Enabled / Disabled
var initInputEnabled = function(formId, val) {
	$(formId).find("input:text, textarea, input:hidden, input:password, input:checkbox, select").each(function(index) {
		if (val) {
			$(this).removeAttr("readonly").css("background-color", "#FFFFFF");
		} else {
			$(this).attr("readonly", "true").css("background-color", "#f3f3f3");

		}
	});
}

var initInputEnabled_disabled = function(formId, val) {
	$(formId).find("input:text, textarea, input:hidden, input:password, input:checkbox, input:radio, select").each(function(index) {
		if (val) {
			$(this).removeAttr("disabled").css("background-color", "#FFFFFF");
		} else {
			$(this).attr("disabled", "true").css("background-color", "#f3f3f3");

		}
	});
}

//�쇰궡 span�� class媛� clear濡� 吏��뺣맂 寃껊뱾�� �댁슜 珥덇린��
var initSpanClear = function(formId) {

	$(formId).find("span.clear").each(function(index) {
		$(this).html("");

	});

}

$.datepicker.regional['ko'] = {
	    closeText: '�リ린',
	    prevText: '�댁쟾��',
	    nextText: '�ㅼ쓬��',
	    currentText: '�ㅻ뒛',
	    monthNames: ['01��(JAN)', '02��(FEB)', '03��(MAR)', '04��(APR)', '05��(MAY)', '06��(JUN)', '07��(JUL)', '08��(AUG)', '09��(SEP)', '10��(OCT)', '11��(NOV)', '12��(DEC)'],
	    monthNamesShort: ['01��', '02��', '03��', '04��', '05��', '06��', '07��', '08��', '09��', '10��', '11��', '12��'],
	    dayNames: ['��', '��', '��', '��', '紐�', '湲�', '��'],
	    dayNamesShort: ['��', '��', '��', '��', '紐�', '湲�', '��'],
	    dayNamesMin: ['��', '��', '��', '��', '紐�', '湲�', '��'],
	    weekHeader: 'Wk',
	    dateFormat: 'yy-mm-dd',
	    firstDay: 0,
	    isRTL: false,
	    showMonthAfterYear: true,
	    yearSuffix: ''
};
$.datepicker.setDefaults($.datepicker.regional['ko']);

//DatePicket �명똿
function setDatePicker(arrObj) {
	for (var i=0; i < arrObj.length; i++)
	{
		$(arrObj[i]).datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true,
			changeYear: true ,
			showOn: "button",
			buttonImage: "/image/btn_calen.png",
			buttonImageOnly: true,
			yearRange: 'c-99:c+0'
		});
	}
}

//�レ옄留똭umberonly='true'
$(document).on("keyup", "input:text[numberOnly]", function() {
	$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
});

//�곷Ц留똢ngOnly='true'
$(document).on("keyup", "input:text[engOnly]", function() {
	$(this).val( $(this).val().replace(/[0-9]|[^\!-z]/gi,"") );
});

//�곷Ц�レ옄留똢ngnumberOnly='true'
$(document).on("keyup", "input:text[engnumberOnly]", function() {
	$(this).val( $(this).val().replace(/[^\!-z\^0-9]/gi,"") );
});

//�곷Ц + �꾩뼱�곌린
$(document).on("keyup", "input:text[eng2Only]", function() {
	$(this).val( $(this).val().replace(/[0-9]|[^\!-z\s]/gi,"") );
});

//�쒓�留똩orOnly='true'
$(document).on("keyup", "input:text[korOnly]", function() {
	$(this).val( $(this).val().replace(/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"\\]/g,"") );
});

function setCookie(cname, cvalue, exdays){
	var d = new Date();
	d.setDate(d.getDate() + 1); //1�� �� �� �쒓컙
	var expires = "expires="+d.toGMTString();
	document.cookie = cname + "=" + cvalue + "; " + expires + "; path=/";
}

function getCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ') c = c.substring(1, c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
	}
	return false;
}

//�섏씠吏� 濡쒕뵫 ��
$(function() {

});

//二쇱냼�쒓났�쒕퉬�� juso.go.kr
var tmpZipcodeaaabbbcccddd = "";
var tmpAddr1aaabbbcccddd = "";
var tmpAddr2aaabbbcccddd = "";

function openAddrJuso(zcode, addr1, addr2) {
	tmpZipcodeaaabbbcccddd = zcode;
	tmpAddr1aaabbbcccddd = addr1;
	tmpAddr2aaabbbcccddd = addr2;
	var pop = window.open("/include/jusoPopup_utf8.php","zippop","width=570,height=420, scrollbars=yes, resizable=yes");

}

function fnJusoCallBack(z, a1, a2) {
	document.getElementById(tmpZipcodeaaabbbcccddd).value = z;
	document.getElementById(tmpAddr1aaabbbcccddd).value = a1;
	document.getElementById(tmpAddr2aaabbbcccddd).value = a2;
}
//二쇱냼�쒓났�쒕퉬�� juso.go.kr END

function showBlindPopup(conts){

	var blind_id = "blind_popup";

	if ($("#mask").length == 0)
	{
		$("body").append('<div id="mask"></div>');
		$("#mask")
			.css("display","none")
			.css("overflow","hidden")
			.css("position","fixed")
			.css("left","0")
			.css("top","0")
			.css("z-index","10000")
			.css("background-color","#000");
	}

	if ($("#"+blind_id).length == 0)
	{
		$("body").append('<div id="'+blind_id+'" class="ui-widget-content" style="position:fixed;z-index:10001; display:none; background:transparent;border:0; padding:10px;"><div id="'+blind_id+'_content"></div></div>');
		$("#"+blind_id).append('<div id="btn_'+blind_id+'_close" style="position:absolute; right:-25px; top:-25px;"><img src="/image/button_close.png"></div>');
		$("#btn_"+blind_id+"_close").css("cursor","pointer").bind("click", function(){
			hideBlindPopup();
		});

		$('body').bind('click', function(event) {
			if (!event) event = window.event;
			var target = (event.target) ? event.target : event.srcElement;
			event.stopPropagation(); // �대깽�� 踰꾨툝留� �꾪뙆瑜� 留됱쓬
			if(target.id == 'mask') {
				hideBlindPopup();
			}
		});
	}

	//�붾㈃�� �믪씠�� �덈퉬瑜� 援ы븳��.
	var maskHeight = $(document).height();
	var maskWidth = $(window).width();

	//hsckdu
	var position = $("#mask").offset();
	if (position.top != 0)
	{
		// �ㅽ겕濡� ��吏곸씠吏� �딅룄濡�
		//$("html, body").animate( { scrollTop : 0 }, 0 );
		//$("html, body").animate({ scrollTop: $(document).height() }, 1000); ///�ㅽ겕濡� �대룞
	}

	$("body").css({overflow:'hidden'});
	$('#mask').css({'width':maskWidth,'height':maskHeight});
	//$('#mask').fadeIn(1000);
	$('#mask').fadeTo("slow",0.7);

	$("#"+blind_id+"_content").html(conts);
	$("#"+blind_id).center().show();

	return false;
}

function hideBlindPopup(){

	$("body").css({overflow:'auto'});
	$("#blind_popup").hide();
	$("#mask").hide();
	$("#blind_popup_content").html("");
}



function blindPlayVideo(container_id, video_id){

	if ($("#mask").length == 0) {
		$("body").append('<div id="mask"></div>');
		$("#mask")
			.css("display","none")
			.css("overflow","hidden")
			.css("position","fixed")
			.css("left","0")
			.css("top","0")
			.css("z-index","10000")
			.css("background-color","#000");
	}

	$("#"+container_id).center().show();


	$('body').bind('click', function(event) {
		if (!event) event = window.event;
		var target = (event.target) ? event.target : event.srcElement;
		event.stopPropagation(); // �대깽�� 踰꾨툝留� �꾪뙆瑜� 留됱쓬
		if(target.id == 'mask') {
			$("#"+container_id).hide();
			video_id.pause();
			$("#mask").hide();
		}
	});

	//�붾㈃�� �믪씠�� �덈퉬瑜� 援ы븳��.
	var maskHeight = $(document).height();
	var maskWidth = $(window).width();

	$('#mask').css({'width':maskWidth,'height':maskHeight});

	//$('#mask').fadeIn(1000);
	$('#mask').fadeTo("slow",0.7);

}



//由ъ뒪�� �섏씠吏�
function makePageList(PageVars) {

	var page = 1, pagesize = 20, blockpage = 10, totalcount = 0, fid = "#pageArea", fname = "fnSearch_page()", not_first_last = true;

	if (typeof PageVars == "object")
	{
		page		= PageVars.page;
		pagesize	= PageVars.pagesize;
		totalcount	= PageVars.totalcount;
		blockpage	= PageVars.blockpage;
		fid			= PageVars.fid;
		fname		= PageVars.fname;
		not_first_last	= PageVars.not_first_last;
	}

	$(fid + " .DivDataCnt").html( "�꾩껜�먮즺 : " + addComma(totalcount) );
	$(fid).css("display", "");

	//留⑥쿂��, 留⑤쭏吏�留� 踰꾪듉 �덈낫�닿쾶
	if (not_first_last) {
		$(fid + "> DIV.paging").smartpaginator({ totalrecords: totalcount, recordsperpage: pagesize, length: blockpage, initval: page, next: '/image/btn_next.gif', prev: '/image/btn_prev.gif', first: '', last: '', theme: 'pagerblack', onchange: function(newPage) {
				PageVars.page = newPage;
				var dynamic_fun = new Function(fname);
				dynamic_fun();

			}
		});
	} else {

		$(fid + "> DIV.paging").smartpaginator({ totalrecords: totalcount, recordsperpage: pagesize, length: blockpage, initval: page, next: '/image/btn_next.gif', prev: '/image/btn_prev.gif', first: '/image/btn_prevEnd.gif', last: '/image/btn_nextEnd.gif', theme: 'pagerblack', onchange: function(newPage) {
				PageVars.page = newPage;
				var dynamic_fun = new Function(fname);
				dynamic_fun();

			}
		});

	}
}


// 諛⑸Ц�대젰 蹂닿린
var fnComVisitView = function(type, pt_no, sdate, edate, page, pagesize) {

	if (pt_no != "" && type != "") {

		var param = {visit_type:type, pt_no:pt_no, sdate:sdate, edate:edate, visit_page:page, visit_pagesize:pagesize};
		fnGetDataList({async:true, url:"/server/getVisitView.php", data:param, callback:function(data) {

			var res     = data.datalist;
			var dlgForm = '';

			if (res.length) {

				var pageNo  = res[0].max_cnt - ((page-1) * pagesize);

				dlgForm += '<div class="popWrap blind_view" style="padding:30px;width:600px;height:420px;">';
				dlgForm += '	<div style="width:100%; height:335px; overflow:auto;">';
				dlgForm += '		<table cellspacing="0" cellpadding="0">';
				dlgForm += '			<colgroup>';
				dlgForm += '				<col width="12%" />';
				dlgForm += '				<col width="22%" />';
				dlgForm += '				<col width="22%" />';
				dlgForm += '				<col width="22%" />';
				dlgForm += '				<col width="22%" />';
				dlgForm += '			</colgroup>';
				dlgForm += '			<tr>';
				dlgForm += '				<th>踰덊샇</th>';
				dlgForm += '				<th>援щ텇</th>';
				dlgForm += '				<th>�꾩씠��</th>';
				dlgForm += '				<th>�대쫫</th>';
				dlgForm += '				<th>諛⑸Ц�쇱떆</th>';
				dlgForm += '			</tr>';

				$.each(res, function(index, entry) {

					dlgForm += '			<tr>';
					dlgForm += '				<td class="tcenter">'+ pageNo +'</td>';
					dlgForm += '				<td class="tcenter">'+ res[index].visit_gn +'</td>';
					dlgForm += '				<td class="tcenter">'+ res[index].userid +'</td>';
					dlgForm += '				<td class="tcenter">'+ res[index].name +'</td>';
					dlgForm += '				<td class="tcenter">'+ res[index].reg_dt +'</td>';
					dlgForm += '			</tr>';

					pageNo = pageNo - 1;

				});

				dlgForm += '		</table>';
				dlgForm += '    </div>';
				dlgForm += '    <div class="mgt10" id="paging_tag2"></div>';
				dlgForm += '</div>';



				showBlindPopup(dlgForm);

				//�섏씠吏�
				fnPaging('paging_tag2', res[0].page_cnt, pageBlindLink, page, pagesize);

			} else {

				dlgForm += '<div class="popWrap blind_view" style="padding:30px;width:600px;height:320px;">';
				dlgForm += '	<table cellspacing="0" cellpadding="0">';
				dlgForm += '		<colgroup>';
				dlgForm += '			<col width="24%" />';
				dlgForm += '			<col width="24%" />';
				dlgForm += '			<col width="24%" />';
				dlgForm += '			<col width="28%" />';
				dlgForm += '		</colgroup>';
				dlgForm += '		<tr>';
				dlgForm += '			<th>援щ텇</th>';
				dlgForm += '			<th>�꾩씠��</th>';
				dlgForm += '			<th>�대쫫</th>';
				dlgForm += '			<th>諛⑸Ц�쇱떆</th>';
				dlgForm += '		</tr>';
				dlgForm += '		<tr><td colspan="4" style="height:100px; text-align:center;">�먮즺媛� �놁뒿�덈떎.</td></tr>';
				dlgForm += '	</table>';
				dlgForm += '</div>';

				showBlindPopup(dlgForm);
			}

		}});

	}

}

function getExt(filename) {

	var _fileLen = filename.length;

	/**
	 * lastIndexOf('.')
	 * �ㅼ뿉�쒕��� '.'�� �꾩튂瑜� 李얘린�꾪븳 �⑥닔
	 * 寃��� 臾몄옄�� �꾩튂瑜� 諛섑솚�쒕떎.
	 * �뚯씪 �대쫫�� '.'�� �ы븿�섎뒗 寃쎌슦媛� �덇린 �뚮Ц�� lastIndexOf() �ъ슜
	 */
	var _lastDot = filename.lastIndexOf('.');

	// �뺤옣�� 紐낅쭔 異붿텧�� �� �뚮Ц�먮줈 蹂�寃�
	var _fileExt = filename.substring(_lastDot, _fileLen).toLowerCase();

	return _fileExt;
}

// �대�吏��곸꽭蹂닿린
var doImgPop = function(img) {
	img1= new Image();
	img1.src=(img);
	imgControll(img);
}

var imgControll = function(img) {
 	if((img1.width!=0)&&(img1.height!=0)){
    	viewImage(img);
  	} else {
     	controller="imgControll('"+img+"')";
     	intervalID=setTimeout(controller,20);
  	}
}

var viewImage = function(img) {
	W=img1.width;
	H=parseInt(img1.height) > 800 ? parseInt(img1.height) - 100 : parseInt(img1.height);
	O="width="+W+",height="+H+",scrollbars=yes";
	imgWin=window.open("","",O);
	imgWin.document.write("<html><head><title>�대�吏��곸꽭蹂닿린</title></head>");
	imgWin.document.write("<body topmargin=0 leftmargin=0>");
	imgWin.document.write("<img src="+ img +" onclick='self.close()' style='cursor:pointer;' title ='�대┃�섏떆硫� 李쎌씠 �ロ옓�덈떎.'>");
	imgWin.document.close();
}

var strip_tag = function(str){
	return str.replace(/(<([^>]+)>)/ig,"");
}