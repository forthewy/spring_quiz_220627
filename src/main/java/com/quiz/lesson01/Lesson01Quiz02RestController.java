package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController // @Controller + @ResponseBody
@RequestMapping("/lesson01/quiz02")
public class Lesson01Quiz02RestController {
	@RequestMapping("/1")
	public List<Map<String,Object>> quiz02_1() {
		// @ResponseBody + return String => HttpMessageConverter String => 글자가 response에 담긴다.
		// @ResponseBody + return 객체 => HttpMessageConverter 객체 jackson 라이브러리 - API
		
		List<Map<String,Object>> movies = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		map.put("rate", 15);
		map.put("director", "봉준호");
		map.put("time", 131);
		map.put("title", "기생충");
		movies.add(map);
		
		map = new HashMap<>(); // 재활용
		map.put("rate", 0);
		map.put("director", "로베르트 베니니");
		map.put("time", 116);
		map.put("title", "인생은 아름다워");
		movies.add(map);
		
		map = new HashMap<>();
		map.put("rate", 12);
		map.put("director", "크리스토퍼 놀란");
		map.put("time", 147);
		map.put("title", "인셉션");
		movies.add(map);
		
		map = new HashMap<>();
		map.put("rate", 19);
		map.put("director", "윤종빈");
		map.put("time", 133);
		map.put("title", "범죄와의 전쟁 : 나쁜놈들의 전성시대");
		movies.add(map);
		
		map = new HashMap<>();
		map.put("rate", 15);
		map.put("director", "프란시스 로렌스");
		map.put("time", 137);
		map.put("title", "헝거게임");
		movies.add(map);
		
		return movies;
	}
	
	@RequestMapping("/2")
	public List<Post> quiz02_2() {
		List<Post> postList = new ArrayList<>();
		
		Post post = new Post(); // 일반 java bean
		post.setTitle("안녕하세요 가입인사 드립니다");
		post.setUser("hagulu");
		post.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁드립니다. 활동 열심히 하겠습니다");
		postList.add(post);
		
		post = new Post(); // 재활용
		post.setTitle("헐 대박");
		post.setUser("bada");
		post.setContent("오늘 목요일이였어.... 금요일인줄");
		postList.add(post);
		
		post = new Post();
		post.setTitle("오늘 데이트한 이야기 해드릴게요");
		post.setUser("dulumary");
		post.setContent(".....");
		postList.add(post);
		
		return postList;
	}
	
	@RequestMapping("/3")
	public ResponseEntity<Post> quiz02_3() {
		Post p1 = new Post();
		p1.setTitle("안녕하세요 가입인사 드립니다");
		p1.setUser("hagulu");
		p1.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁드립니다. 활동 열심히 하겠습니다");
		return new ResponseEntity<>(p1, HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
