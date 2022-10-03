package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson05.bo.WeatherHistoryBO;
import com.quiz.lesson05.model.WeatherHistory;

@RequestMapping("/lesson05")
@Controller
public class Lesson05Quiz05Controller {
	
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	@GetMapping("/quiz05/show_weather_view")
	public String showWeatherView(Model model) {
		List<WeatherHistory> weatherHistory = weatherHistoryBO.getAllWeatherHistory();
		
		model.addAttribute("weatherHistory", weatherHistory);
		return "lesson05/quiz05_1";
	}
	
	@GetMapping("/quiz05/add_weather_view")
	public String addWeatherView() {
		return "lesson05/quiz05_2";
	}
	
	@PostMapping("/quiz05/after_add_weather")
	public String afterAddWeather(WeatherHistory weatherHistory) {
		weatherHistoryBO.addWeatherHistory(weatherHistory);
		
		return "redirect:show_weather_view";
	}
}
