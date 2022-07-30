package com.spring.example.domain;






import java.util.Date;


import lombok.Data;

@Data
public class BoardVO {
	private int bno;
	private String faclt_nm;
	private String category;
	private String imageurl;
	private String tel;
	private Date reservday;
}
