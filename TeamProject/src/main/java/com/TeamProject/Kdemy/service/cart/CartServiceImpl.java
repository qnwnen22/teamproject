package com.TeamProject.Kdemy.service.cart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.cart.dao.CartDAO;
import com.TeamProject.Kdemy.model.cart.dto.CartDTO;
import com.TeamProject.Kdemy.model.lecture.dto.LectureBoxDTO;

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

	@Override
	public void buyCart(String userid, String lecture_idx) {
		cartDao.buyCart(userid, lecture_idx);
	}
	@Override
	public void insertLectureBox(String userid, String nickname, String cell_type, String lecture_idx) {
		cartDao.insertLectureBox(userid, nickname, cell_type, lecture_idx);
	}

	@Override
	public void pointCharge(String userid) {
		cartDao.pointCharge(userid);
	}

}
