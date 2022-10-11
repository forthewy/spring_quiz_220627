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
	public String BookingListView(Model model) { // List를 받아올땐 List라고 적어주는 게 좋다. // view 는 view라고 적어줄것.
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		return "lesson06/bookingList";
	}
	
	// AJAX 호출
	@ResponseBody
	@DeleteMapping("/delete_booking")
	public Map<String, Object> deleteBooking(
			@RequestParam("id") int id) {
		Map<String, Object> result = new HashMap<>();
		int deleteRow = bookingBO.deleteBooking(id);
		
		if (deleteRow > 0) {
			result.put("response", 200);
			result.put("result", "성공");
		} else {
			result.put("response", 400);
			result.put("errorMessage", "삭제할 예약내역이 없습니다.");
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
			@RequestParam("date") String date, // Date로 @Dateformat 써도 된다. insert와 output이 분리되어있기에 string으로 써도되고.
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam(value="state", defaultValue="대기중") String state 
			){
		Map<String, Object> result = new HashMap<>();
		// request 먼저 잘나오는지 꼭 검증하기 
		// state는  mapper에서 하드 코딩으로 넣어주어도 된다. mapper에서 넣어주면 안가지고 다녀도 됨.
		int addRow = bookingBO.addBooking(name, date, day, headcount, phoneNumber, state);
		if (addRow > 0) {
			result.put("code", 200); // 개인 프로젝트시 코드를 따로 잘 정리해두어야 한다.
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
	
	@GetMapping("/searchReserve") // booking이든 reserve든 이름을 통일해야할 듯하다.
	@ResponseBody
	public Map<String, Object> searchReserve(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber){
		
		Map<String, Object> result = new HashMap<>();
		
		List<Booking> booking = bookingBO.getBookingByNameAndPhoneNum(name, phoneNumber);
		if (booking == null) {
			result.put("code", 500);
			result.put("errorMessage", "조회 결과가 없습니다");
		} else {
			result.put("code", 200);
			result.put("booking", booking);
		} // 로직보다는 response 에 가깝다
		
		return result;
	}
	
}
