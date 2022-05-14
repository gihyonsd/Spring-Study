package org.zerock.sample;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Component
@ToString
//@AllArgsConstructor//단일 생성자 주입
@RequiredArgsConstructor
public class SampleHotel {

	//private Chef chef;
	private final Chef chef;

	/*public SampleHotel(Chef chef) {
		super();
		this.chef = chef;
	}*/
	
	
}
