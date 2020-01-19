package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	private String orderId;
	private String userId;
	private String orderRec;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String userAddr4;
	private String orderPhon;
	private int amount;
	private Date orderDate;
	private int CK;
	private int orderDetailsNum;
	private int gdsNum;
	private int cartStock;
	
	private String gdsName;
	private String gdsThumbImg;
	private int gdsPrice;
	
	private String delivery;
	

	
}
