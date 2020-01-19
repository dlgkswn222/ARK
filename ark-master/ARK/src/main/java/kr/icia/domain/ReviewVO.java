package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
  private Long num;
  private String title;
  private String content;
  private int count;
  private String writer;
  private Date ttdate;
  private String gdsImg;
  private String gdsthumbimg;
  private String cateCode;
  
 
}
