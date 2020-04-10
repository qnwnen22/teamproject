package com.TeamProject.Kdemy.service.cart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.cart.dao.CartDAO;
import com.TeamProject.Kdemy.model.cart.dto.CartDTO;

@Service
public class CartServiceImpl implements CartService {

	@Inject
	CartDAO cartDao;
	
	@Override
	public List<CartDTO> cartList(CartDTO dto) {
		return cartDao.cartList(dto);
	}

	@Override
	public List<CartDTO> testList() {
		return cartDao.testList();
	}


	@Override
	public void insertCart(CartDTO dto) {
		cartDao.insertCart(dto);
	}

	@Override
	public int pointCheck(String userid) {
		return cartDao.pointCheck(userid);
	}

	@Override
	public void buyLecture(String userid, int price) {
		cartDao.buyLecture(userid, price);
	}

	@Override
	public void insertLectureBox(String userid, String cell_type, String lecture_idx) {
		cartDao.insertLectureBox(userid, cell_type, lecture_idx);
	}

	@Override
	public int cartCheck(CartDTO dto) {
		return cartDao.cartCheck(dto);
	}
	public void deleteAll(String userid) {
		cartDao.deleteAll(userid);
	}

	@Override
	public void delete(String cart_idx) {
		cartDao.delete(cart_idx);
		
	}

}