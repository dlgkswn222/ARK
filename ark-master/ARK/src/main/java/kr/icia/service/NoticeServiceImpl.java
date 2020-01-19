package kr.icia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.icia.domain.Criteria;
import kr.icia.domain.ImgVO;
import kr.icia.domain.NoticeVO;
import kr.icia.mapper.ImgMapper;
import kr.icia.mapper.NoticeMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
/* @AllArgsConstructor */
public class NoticeServiceImpl implements NoticeService {

	@Setter(onMethod_=@Autowired)
	private NoticeMapper mapper;
	
	
	@Setter(onMethod_=@Autowired)
	private ImgMapper imgMapper;
	
	@Transactional
	
	@Override
	public void register(NoticeVO notice) {
		log.info("register......" + notice);
	
		mapper.insertSelectKey(notice);
		
		if(notice.getUpload()==null || notice.getUpload().size() <=0) {
			return;
		}
		
		notice.getUpload().forEach(upload->{
			upload.setNtnum(notice.getNtnum());
			imgMapper.insert(upload);
		});
		
	}
	
	@Override
	public NoticeVO get(Long ntnum) {
		log.info("get......"+ntnum);
		return mapper.read(ntnum);
	}
	
	@Override
	public boolean modify(NoticeVO notice) {
		log.info("modify......."+notice);
		return mapper.update(notice)==1;
	}
	
	@Override
	public boolean remove(Long ntnum) {
		log.info("remove......."+ntnum);
		imgMapper.deleteAll(ntnum);
		return mapper.delete(ntnum)==1;
	}
	
	@Override
	public List<NoticeVO> getList() {
		log.info("getList......");
		return mapper.getList();
	}

	@Override
	public List<ImgVO> getUpload(Long ntnum) {
		log.info("get Img list by ntnum: " + ntnum);
		return imgMapper.findByNtnum(ntnum);
		// 게시물 번호를 전달하고,
		// 게시물 번호와 일치하는 첨부파일을 모두 리턴.
	}

	@Override
	public boolean viewCnt(Long ntnum) {
		
		return mapper.viewCnt(ntnum);
	}

	@Override
	public List<NoticeVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}









}
