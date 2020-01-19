package kr.icia.domain;


import java.util.Date;
import java.util.List;

import lombok.Data;
@Data  
public class NoticeVO {
    private Long ntnum;
    private String nttitle;
    private String ntcontent;
    private Date ntdate;
    private int viewct;
    private List<ImgVO> upload;
    private int rownum;
}// end of class
