package org.zerock.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//Setter 주입
//생성자 주입
//필드 주입
@Component
@ToString
//@AllArgsConstructor
@RequiredArgsConstructor

public class Restaurant {
	
	//@Autowired //필드 주입
	//@Setter(onMethod_ = {@Autowired}) //Setter 주입
	private final Chef chef;
}
