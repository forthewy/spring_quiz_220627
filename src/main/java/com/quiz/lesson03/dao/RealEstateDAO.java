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
	
	public int InsertRealEstate(RealEstate realEstate);
	
	public int InsertRealEstateAsField(
			@Param("realtorId") int realtorId,
			@Param("address") String address, 
			@Param("area") int area, 
			@Param("type") String type, 
			@Param("price") int price, 
			@Param("rentPrice") Integer rentPrice
	);
	
	public int updateRealEstateById(
			@Param("id") int id, 
			@Param("type") String type, 
			@Param("price") int price
	);
	
	public void deleteRealEstateById(
			@Param("id") int id
	);
}
