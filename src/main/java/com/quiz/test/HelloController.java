package com.quiz.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
	@ResponseBody // 
	@RequestMapping("/quizTest1") // 주소
	public String helloWold() {
		return "Hello World!";
	}
}
