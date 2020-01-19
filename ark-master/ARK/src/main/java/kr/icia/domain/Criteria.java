package kr.icia.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 롬복을 이용하여,필드만 선언하면 갯터,셋터,투스트링 생성
// 투 스트링 생성
@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum; // 현재 페이지 번호
	private int amount;   //페이지당 게시물수
	private String type;  // 검색 타입. 내용 | 제목 | 작성자
	private String keyword;// 검색어
	private int cateCode;
	private int level;
	private int cateCodeRef;
	public Criteria() {
		this(1, 10);  //1페이지에 10개의 게시물을 보여주어라
					
					// 여기서 this는 자기자신을 불러오는것이기때문에
					// 아래 자신을 불러와 초기화를 하는것을 의미
		}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum; 
		this.amount = amount;     
	}
	
public String[] getTypeArr() {
	// 검색 타입 배열 가져오기.
	return type==null?new String[] {}:type.split("");
	//검색 타입이 널이라면 비여있는 문자열 배열을 만들고,
	// 그렇지 않다면, 검색타입을 한글자씩 잘라서 문자열 배열로 만듦.
}
	
public String getListLink() {
	UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
			.queryParam("pageNum",this.pageNum)
			.queryParam("amount",this.getAmount())
			.queryParam("cateCode",this.getCateCode())
			.queryParam("level",this.getLevel())
			.queryParam("type",this.getType())
			.queryParam("getKeyword",this.getKeyword());
	
	return builder.toUriString();
	// 기존의 get 방식으로 전달하던 page, amount,type,keyword
	// 즉 , 현재 페이지, 페이지당 게시물수 , 검색타입, 검색어
	// 를 주소창에get 방식으로 붙여서 보냈는데,
	// 일일이 값을 호출해서 처리하는것이 아니라,
	// getListLink 메소드에서 한꺼번에 처리하도록 변경
}
}


