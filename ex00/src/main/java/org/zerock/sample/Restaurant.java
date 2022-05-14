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
//스프링은 객체지향을 하는 프레임워크 웹을 하는 프레임 워크는 아님 
//스프링은 servlet-context.xml은 웹과 관련된 설정을 하고 root-context.xml은 객체 지향과 관련된 설정을 한다.
