package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01/")
@Controller
public class Lesson04Quiz01Controller {
	@Autowired
	private SellerBO sellerBO;
	
	//http://localhost/lesson04/quiz01/1
	@RequestMapping("1")
	public String addSellerView() {
		return "/lesson04/add_seller";
	}
	
	@RequestMapping("add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl,
			@RequestParam(value="temperature", required=false) Double temperature
		){
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		return "/lesson04/after_add_seller";
	}
	
	@GetMapping("seller_info")
	public String getLastSeller(
			@RequestParam(value="id", required=false) Integer id,
			Model model){
		
		Seller seller = null;
		if (id == null) {
			seller = sellerBO.getLastSeller();
		} else {
			seller = sellerBO.getSeller(id);
		}
			model.addAttribute("result", seller);
			model.addAttribute("subject", "판매자 정보");
			
			return "/lesson04/get_seller_info";
	}
	
}
