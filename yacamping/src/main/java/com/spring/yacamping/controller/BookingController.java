package com.spring.yacamping.controller;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.yacamping.domain.BoardVO;
import com.spring.yacamping.domain.BookingVO;
import com.spring.yacamping.domain.Criteria;
import com.spring.yacamping.service.BoardService;
import com.spring.yacamping.service.BookingService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
public class BookingController {
	
	private BookingService service;
	@PostMapping("/booking")
	public String booking(@RequestParam("totalprice")int price, @RequestParam(value = "audult_no")int audult_no, @RequestParam(value = "child_no")int child_no, HttpSession session, BoardVO board, BookingVO booking, RedirectAttributes rttr) throws ParseException {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH));
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String sub = "";
		for(int i = 1; i <= 6; i++) {
			sub += (int)(Math.random() * 10);
		}
		Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(booking.getStartDate());
		Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(booking.getEndDate());
		long diffSec = (format2.getTime() - format1.getTime()) / 1000; //초 차이
		int diffDays = (int) (diffSec / (24*60*60)); //일자수 차이
		String reservid = ymd + "-" + sub;
		booking.setTotalprice(diffDays * price);
		booking.setReservid(reservid);
		String id = (String)session.getAttribute("id");
		booking.setId(id);
		booking.setAudult_no(audult_no);
		booking.setChild_no(child_no);
		service.booking(booking);
		rttr.addFlashAttribute("result", booking.getCampnum());
		return "/board/bookingConfirm";
	}
}

