package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04Quiz02Controller {
	
	@Autowired
	private RealtorBO realtorBO;
	
	@RequestMapping("/add_realtor_view")
	public String addRealtorView() {
		return "lesson04/addRealtor";
	}
	
	@PostMapping("/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor, // 
			Model model) {
		
		realtorBO.addRealtor(realtor);
		Realtor currentRealtor = realtorBO.getRealtorById(realtor.getId());
		// 담아두면 디버그시 확인하기 좋다.
		model.addAttribute("realtor", currentRealtor);
		model.addAttribute("subject", "공인중개사 정보");
		return "lesson04/afterAddRealtor";
	}
}
