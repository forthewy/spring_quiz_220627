package com.quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.quiz.lesson05.dao.WeatherHistoryDAO;
import com.quiz.lesson05.model.WeatherHistory;

public class WeatherHistoryBO {
	
	@Autowired
	private WeatherHistoryDAO weatherHistoryDAO;
	
	public void addWeatherHistory(WeatherHistory weatherHistory) {
		weatherHistoryDAO.insertWeatherHistory(weatherHistory);
	}
	
	public List<WeatherHistory> getAllWeatherHistory() {
		return weatherHistoryDAO.selectAllWeatherHistory();
	}
}
