package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@RequestMapping("/lesson06")
@Controller
public class Lesson06Controller {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	@RequestMapping("/quiz01/add_favorite_view")
	public String addFavorite() {
		
		return "lesson06/addFavorite";
	}
	
	// AJAX가 호출하는 API => @ResponseBody 있어야함
	@ResponseBody
	@PostMapping("/quiz01/add_favorite")
	public String addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		favoriteBO.addFavorite(name, url);
		return "success";
	}
	
	@RequestMapping("/quiz01/get_favorite_view")
	public String getFavoriteView(Model model) {
		List<Favorite> favors = favoriteBO.getFavorite();
		model.addAttribute("favors", favors);
		
		return "lesson06/favoriteList";
	}
	
	@PostMapping("/quiz02/duplicate_check")
	@ResponseBody
	public Map<String, Boolean> duplicateCheck(
			@RequestParam("url") String url) {
		
		Map<String, Boolean> result = new HashMap<>();
		Favorite favorite = favoriteBO.getFavoriteByUrl(url);
		if (favorite == null) {
			result.put("is_duplicate", false);
		} else {
			result.put("is_duplicate", true);
		}
		return result;
	}
}
