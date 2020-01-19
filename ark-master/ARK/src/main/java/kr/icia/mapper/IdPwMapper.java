package kr.icia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import kr.icia.domain.NewMemberVO;
import kr.icia.domain.NewpassVO;

public interface IdPwMapper {

	public List<NewMemberVO> id(String email);
	
	
	public void update(NewMemberVO v);
}
