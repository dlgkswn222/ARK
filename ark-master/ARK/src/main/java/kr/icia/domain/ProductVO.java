package kr.icia.domain;

import java.util.Date;

import lombok.Data;

/*
create table ARK_product_info
(pronum number,
 id VARCHAR2(15),
 proname nvarchar2(40),
 prodate date default sysdate,
 procontent nclob,
 proprice int,
 proStock number(4) not null,
 proInfo NVARCHAR2(500),
 catecode NVARCHAR2(30)
 );
 
 */
@Data
public class ProductVO{
	private int pronum;
	private String id;
	private String proname;
	private Date prodate;
	private String procontent;
	private int proprice;
	private int prostock;
	private String proinfo;
	private String catecode;
	private String prothumbcontent;
}
