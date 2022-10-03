package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;
import com.quiz.lesson05.bo.ReviewBO;
import com.quiz.lesson05.model.Review;

@RequestMapping("/lesson05/quiz06")
@Controller
public class Lesson05Quiz06Controller {
	
	@Autowired
	private StoreBO storeBO;

	@Autowired
	private ReviewBO reviewBO;
	
	@GetMapping("/show_stores_view")
	public String showAllStore(Model model) {
		
		List<Store> stores = storeBO.getStoreList();
		model.addAttribute("stores", stores);
		
		return "lesson05/quiz06_1";
	}
	
	@GetMapping("/reviews")
	public String showReview(
			@RequestParam("storeId") int storeId
			, @RequestParam("storeName") String storeName
			, Model model){
		
		List<Review> reviews = reviewBO.getReviewsByStoreId(storeId);

		model.addAttribute("storeName", storeName);
		model.addAttribute("reviews", reviews);
		
		return "lesson05/quiz06_2";
	}
}
