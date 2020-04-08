package com.TeamProject.Kdemy.service.cart;

import java.util.List;

import com.TeamProject.Kdemy.model.cart.dto.CartDTO;

public interface CartService {

	List<CartDTO> cartList(CartDTO dto);

	List<CartDTO> testList();

	public void deleteCart(String userid, String lecture_idx);

	public void insertCart(CartDTO dto);

	public int pointCheck(String userid);

	public void buyLecture(String userid, int price);

	public void insertLectureBox(String userid, String cell_type, String lecture_idx);

}
