package com.quiz.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson02.dao.StoreDAO;
import com.quiz.lesson02.model.Store;

@Service
public class StoreBO {
	
	//DI(Dependency Injection) 의존성 주입
	@Autowired
	private StoreDAO storeDAO;
	
	// input: X output:List<Store>
	public List<Store> getStoreList() { // select일때 관례적으로 get 사용
		return storeDAO.selectStoreList();
	}
}
