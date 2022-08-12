package com.spring.yacamping.service;

import java.util.List;

import com.spring.yacamping.domain.BookingVO;
import com.spring.yacamping.domain.KakaoBookingVO;

public interface BookingService {
	public void booking(BookingVO booking);
	
	public void bookingkakao(BookingVO booking);
	
	public List<BookingVO> getBookingList(BookingVO booking);
	
	public List<BookingVO> getKakaoList(KakaoBookingVO booking);
}
