package kr.icia.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

	private int startPage;    //페이징 시작
	private int endPage;	  //페이징끝
	private boolean prev,next;//이전 다음 가기버튼
	private int total;		  //총 게시물 수
	private Criteria cri;	  // 현재 페이지당 게시물수	
	
	public PageDTO(Criteria cri,int total) {
		
		this.cri=cri;
		this.total=total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		
		this.startPage = this.endPage-9;
		
		int realEnd = (int)(Math.ceil((total*1.0)/
				cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage >1;
		this.next = this.endPage <realEnd;
	}
}
