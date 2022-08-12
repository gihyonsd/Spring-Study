package com.spring.yacamping.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.spring.yacamping.domain.BookingVO;
import com.spring.yacamping.domain.KakaoBookingVO;
import com.spring.yacamping.mapper.BookingMapper;
import com.spring.yacamping.service.BookingService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Primary
@Service

@AllArgsConstructor
@Log4j
public class BookingServiceImpl implements BookingService{
	@Setter(onMethod_ = @Autowired) 
	private BookingMapper mapper;
	
	@Override
	public void booking(BookingVO booking) {
		log.info("booking");
		mapper.insert(booking);
	}

	@Override
	public void bookingkakao(BookingVO booking) {
		log.info("bookingkakao.............");
		mapper.insertkakao(booking);
	}

	@Override
	public List<BookingVO> getBookingList(BookingVO booking) {
		
		return mapper.getBooking(booking);
	}

	@Override
	public List<BookingVO> getKakaoList(KakaoBookingVO booking) {
		
		return mapper.getKakao(booking);
	}
}
