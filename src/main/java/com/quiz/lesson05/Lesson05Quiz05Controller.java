package com.quiz.lesson05;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.bo.WeatherHistoryBO;
import com.quiz.lesson05.model.WeatherHistory;

@RequestMapping("/lesson05")
@Controller
public class Lesson05Quiz05Controller {
	
	
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	/** 
	 *  히스토리 목록 화면
	 * @return
	 * 
	 */
	@GetMapping("/quiz05/show_weather_view")
	public String showWeatherView(Model model) {
		List<WeatherHistory> weatherHistory = weatherHistoryBO.getAllWeatherHistory();
		
		model.addAttribute("weatherHistory", weatherHistory);
		return "lesson05/quiz05_1";
	}
	
	/**
	 * 날씨 추가 화면
	 * @return
	 */
	@GetMapping("/quiz05/add_weather_view")
	public String addWeatherView() {
		return "lesson05/quiz05_2";
	}
	
	
	@PostMapping("/quiz05/after_add_weather")
	public String afterAddWeather(
			// @RequestParam("date") @DateTimeFormat(pattern="yyyy-mm-dd") Date date
			@RequestParam("date") String date,
			@RequestParam("weather") String weather,
			@RequestParam("microDust") String microDust,
			@RequestParam("temperatures") double temperatures,
			@RequestParam("precipitation") double precipitation,
			@RequestParam("windSpeed") double windSpeed
			) {
		
		weatherHistoryBO.addWeatherHistory(date, weather, microDust, temperatures, precipitation, windSpeed);
		
		return "redirect:/lesson05/quiz05/show_weather_view";
	}
}
