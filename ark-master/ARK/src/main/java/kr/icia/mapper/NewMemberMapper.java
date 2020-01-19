package kr.icia.mapper;

import org.apache.ibatis.annotations.Param;

import kr.icia.domain.NewMemberVO;

public interface NewMemberMapper {
	public void insert(NewMemberVO member);
	
	public void insert2(NewMemberVO member);
	
	public int getMapper(@Param("id")String id);

	public void ImgUpdate(NewMemberVO vo);
	
	public void img(NewMemberVO member);
	
	public String userIdCheck2(NewMemberVO v);
}
