package kr.icia.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
public class GoodsVO {

	private int gdsNum;
	private String gdsName;
	private String cateCode;
	private int gdsPrice;
	private int gdsStock;
	private String gdsDes;
	private String gdsImg;
	
	
	private String gdsThumbImg;
	
	private String cateCodeRef;
	private String cateName;
	
	private Date gdsDate;
	
	private int like_cnt;
}
