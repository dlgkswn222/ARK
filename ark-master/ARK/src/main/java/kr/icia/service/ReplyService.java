package kr.icia.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import kr.icia.domain.Criteria;
import kr.icia.domain.ReplyPageDTO;
import kr.icia.domain.ReplyVO;

public interface ReplyService {

	
	
	public int register(ReplyVO vo);
	
	public ReplyVO read(Long rno);
	
	public int remove(Long rno);
	
	public int modify(ReplyVO reply);
	
	public List<ReplyVO> getList(@Param("cri")Criteria cri,
									  @Param("bno") Long bno);
	//페이지 정보와 게시물 번호 전달.
	public ReplyPageDTO getListPage(Criteria cri,Long bno);
	
}
