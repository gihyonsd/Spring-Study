package com.spring.yacamping.domain;






import java.util.Date;


import lombok.Data;

@Data
public class KakaoBookingVO {
	private int campnum;
	private String user_num;
	private String reservid;
	private String id;
	private String facltnm;
	private int audult_no;
	private int child_no;
	private Date reservday;
	private int totalprice;
	private int price;
	private String checkin;
	private String checkout;
	private String startDate;
	private String endDate;
}
