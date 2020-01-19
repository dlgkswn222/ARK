package kr.icia.service;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import kr.icia.domain.NewMemberVO;
import kr.icia.domain.NewpassVO;

public interface NewMemberService {

	public void insert(NewMemberVO member);
	
	public void insert2(NewMemberVO member);
	
	public int  userIdCheck(@Param("id")String id);
	
	public void update(NewMemberVO v);
	
	public void img(NewMemberVO member);
	
	public String userIdCheck2(NewMemberVO v);
}
