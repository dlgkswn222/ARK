package kr.icia.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.icia.domain.MemberVO;
import kr.icia.domain.NewMemberVO;

public interface MemberMapper {

	public NewMemberVO read(String id);
	// 사용자가 아이디를 입력하면 , 그에 해당하는 계정 정보를
	//디비에서 추출.

	
	
}
