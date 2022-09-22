package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	public RealEstate RealEstateSelectById(int id);
	
	public List<RealEstate> SelectRealEstateListByRentPrice(int rentPrice);

	public List<RealEstate> SelectRealEstateListByAreaAndPrice(
			@Param("area") int area
			, @Param("price") int price
	);
	
}
