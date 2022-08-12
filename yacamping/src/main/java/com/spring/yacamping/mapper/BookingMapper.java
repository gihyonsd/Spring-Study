package com.spring.yacamping.mapper;

import java.util.List;

import com.spring.yacamping.domain.BookingVO;
import com.spring.yacamping.domain.KakaoBookingVO;

public interface BookingMapper {
	public void insert(BookingVO booking);
	
	public void insertkakao(BookingVO booking);
	
	public List<BookingVO> getBooking(BookingVO booking);
	
	public List<BookingVO> getKakao(KakaoBookingVO booking);
}
