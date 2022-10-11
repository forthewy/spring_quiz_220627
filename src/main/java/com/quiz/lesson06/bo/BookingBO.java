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
	
	public int deleteBooking(int id) {
		return bookingDAO.deleteBooking(id);
	}
	
	public int addBooking(String name, String date, int day, int headcount,String phoneNumber, String state) {
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber, state);
	}
	
	public Booking getBookingByNameAndPhoneNum(String name, String phoneNumber){
		return bookingDAO.selectBookingByNameAndPhoneNum(name, phoneNumber);
	}
}
