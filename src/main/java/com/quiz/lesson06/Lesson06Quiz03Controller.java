package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String reserveView() {
		return "lesson06/addBooking";
	}
	
	@ResponseBody
	@PostMapping("/add_booking")
	public Map<String, Object> addBooking(
			@RequestParam("name") String name,
			@RequestParam("date") String date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam(value="state", defaultValue="대기중") String state
			){
		Map<String, Object> result = new HashMap<>();

		int addRow = bookingBO.addBooking(name, date, day, headcount, phoneNumber, state);
		
		if (addRow > 0) {
			result.put("code", 200);
			result.put("message", "예약성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "예약등록에 실패하였습니다. 문의주세요");
		}
		return result;
	}
	
	@GetMapping("/3")
	public String getMain() {
		return "lesson06/bookingMain";
	}
	
	@GetMapping("/searchReserve")
	@ResponseBody
	public Map<String, Object> searchReserve(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber){
		
		Map<String, Object> result = new HashMap<>();
		
		Booking booking = bookingBO.getBookingByNameAndPhoneNum(name, phoneNumber);
		if (booking == null) {
			result.put("code", 500);
			result.put("errorMessage", "조회 결과가 없습니다");
		} else {
			result.put("code", 200);
			result.put("booking", booking);
		}
		
		return result;
	}
	
}
