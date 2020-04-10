package com.TeamProject.Kdemy.model.cart.dao;

import java.util.List;

import com.TeamProject.Kdemy.model.cart.dto.CartDTO;

public interface CartDAO {

	public List<CartDTO> cartList(CartDTO dto);

	public List<CartDTO> testList();


	public void insertCart(CartDTO dto);

	public int pointCheck(String userid);

	public void buyLecture(String userid, int price);
	
	public void insertLectureBox(String userid, String cell_type, String lecture_idx);
	
	public void deleteAll(String userid);//장바구니 전체지우기
	
	public void delete(String cart_idx);//장바구니 개별 상품 삭제

	public int cartCheck(CartDTO dto);

}
