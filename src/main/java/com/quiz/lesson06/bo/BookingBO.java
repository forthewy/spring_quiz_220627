package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {

	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	public int deleteBooking(int id) { // deleteBookingById 메소드명 명확하게 써주는 게 좋을 것 같다.
		return bookingDAO.deleteBooking(id);
	}
	
	public int addBooking(String name, String date, int day, int headcount,String phoneNumber, String state) {
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber, state);
	}
	
	public List<Booking> getBookingByNameAndPhoneNum(String name, String phoneNumber){
		return bookingDAO.selectBookingByNameAndPhoneNum(name, phoneNumber);
	}
	
	/*	public Booking getBookingByNameAndPhoneNum(String name, String phoneNumber){
	 * 		// 같은사람 예약건이 여러개 있어도 하나만 BO에서 받겠다.
	 *		// List<Booking> bookingList = bookingDAO.selectBookingByNameAndPhoneNum;
	 *		// if (CollectionUtils.isEmpty(bookingList)) // List 같은 Collection이 비었는 지 확인.
	 *		// 		return null;
	 *		//}
	 *		// return bookingList.get(bookingList.size() - 1); // 마지막 인덱스 데이터 가져옴.
	 *		// 이렇게 가공하는 코드는 BO 에 쓸것. 
	 */
}
