package com.quiz.lesson05.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.Review;

@Repository
public interface ReviewDAO {
	public List<Review> selectReviewsByStoreId(int storeId);
}
