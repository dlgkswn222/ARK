package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductViewVO {
	
		private int pronum;
		private String id;
		private String proname;
		private Date prodate;
		private String procontent;
		private int proprice;
		private int prostock;
		private String proinfo;
		private String catecode;
		
		private String catename;
		private String catecoderef;
}

