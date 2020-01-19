package kr.icia.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class NewMemberVO {
	private String userimg;
	private int mb;
	private String id;
	private String name;
	private String pass;
	private String phonenum;
	private String useremail;
	private Date userday;
	

	
	private int uoop;
	private String doro;
	private String jibun;
	
	public List<AuthVO> authList;
}
