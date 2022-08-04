package com.spring.yacamping.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria extends BoardVO{

	private int pageNum;
	private int amount;
	
	
	private String type;
	private String Keyword;
	private String category;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	
	public Criteria() {
		this(1,4);
	}

	public Criteria(int pageNum, int amount) {
		
		this.pageNum = pageNum;
		this.amount = amount;
		
	}

	public String[] getTypeArr() {
		
		return type ==null? new String[] {} : type.split("");
		
	}
}
