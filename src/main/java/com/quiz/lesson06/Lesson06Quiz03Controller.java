package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@RequestMapping("/lesson06/quiz03")
@Controller
public class Lesson06Quiz03Controller {

	@Autowired
	private BookingBO bookingBO;
	
	@RequestMapping("/1")
	public String getMainView(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		return "lesson06/bookingList";
	}
	
	// AJAX 요청
	@ResponseBody
	@DeleteMapping("/delete_booking")
	public Map<String, Object> deleteBooking(int id) {
		Map<String, Object> result = new HashMap<>();
		int deleteRow = bookingBO.deleteBooking(id);
		
		if (deleteRow > 0) {
			result.put("response", 200);
			result.put("result", "성공");
		} else {
			result.put("response", 400);
			result.put("errorMessage", "예약 삭제를 실패하였습니다.");
		}
		return result;
	}
	
	@RequestMapping("/2")
	public String 
}
