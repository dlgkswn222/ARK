package kr.icia.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
//getter setter  toString equals 자동으로 만들어준다
@Data  
public class BoardVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	private int replyCnt;
	private List<BoardAttachVO> attachList;	
	
}// end of class
