package com.spring.yacamping.domain;






import java.util.Date;


import lombok.Data;

@Data
public class BoardVO {
	private int campnum;
	private String addr1;
	private String facltnm;
	private String featurenm;
	private String firstimageurl;
	private String induty;
	private String intro;
	private String lineintro;
	private String homepage;
	private String mapx;
	private String mapy;
	private Date reservday;
	private int price;
	private String tel;
}
