package kr.icia.domain;

import java.util.Date;

//import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data


public class ReplyVO {
	private Long rno;
	private Long bno;
	
	private String reply;
	private String replyer;
	private String userName;
	
//	@JsonFormat(pattern="yyyy-MM-dd")
	private Date replyDate;
	private Date updateDate;
	
	private Long num;

	private String userId;

	private int repNum;

	private String repCon;

	private Date repDate;

}
