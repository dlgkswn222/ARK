package kr.icia.service;

import java.util.List;

import kr.icia.domain.Criteria;
import kr.icia.domain.ImgVO;
import kr.icia.domain.NoticeVO;

public interface NoticeService {

	public void register(NoticeVO notice);
	
	public NoticeVO get(Long ntnum);
	
	public boolean modify(NoticeVO notice);
	
	public boolean remove(Long ntnum);
	
	public List<NoticeVO> getList();
	
	public List<ImgVO> getUpload(Long ntnum);
	
	public boolean viewCnt(Long ntnum);
	
	public List<NoticeVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
