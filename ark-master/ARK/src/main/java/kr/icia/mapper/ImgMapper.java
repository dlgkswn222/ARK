package kr.icia.mapper;

import java.util.List;

import kr.icia.domain.ImgVO;

public interface ImgMapper {

	public void insert(ImgVO vo);
	
	public void delete(String uuid);
	
	public List<ImgVO> findByNtnum(Long ntnum);
	
	public void deleteAll(Long ntnum);
	
	public List<ImgVO> getOldFiles();
}
