package kr.icia.mapper;

import java.util.List;

import kr.icia.domain.Criteria;
import kr.icia.domain.NoticeVO;


public interface NoticeMapper {

	public List<NoticeVO>getList();

	public void insert(NoticeVO notice);
	
	public void insertSelectKey(NoticeVO notice);
	
	public NoticeVO read(Long ntnum);
	
	public int delete(Long ntnum);
	
	public int update(NoticeVO notice);

	public boolean viewCnt(Long ntnum);
	
	public List<NoticeVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);

}
