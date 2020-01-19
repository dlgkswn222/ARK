package kr.icia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.icia.domain.BoardVO;
import kr.icia.domain.Criteria;


public interface BoardMapper {

	//@Select("select * from tbl_board where bno>0")
	
	public List<BoardVO>getList();
	
	public List<BoardVO>getListWithPaging(Criteria cri);
	
	
	public void insert(BoardVO board);
	// bno 는 시퀀스 자동 생성으로 나머지 값만 입력.
	
	public void insertSelectKey(BoardVO board);
	// 생성되는 시퀀스 값을 확인하고 나머지 값 입력.

	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
	
	public int getTotalCount(Criteria cri);
	//총 게시물수 파악.
	
	public void updateReplyCnt(@Param("bno")Long bno, @Param("amount")int amount);
}
