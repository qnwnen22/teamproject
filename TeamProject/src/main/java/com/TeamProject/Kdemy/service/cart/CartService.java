package com.TeamProject.Kdemy.service.cart;

import java.util.List;

import com.TeamProject.Kdemy.model.cart.dto.CartDTO;
import com.TeamProject.Kdemy.model.lecture.dto.LectureBoxDTO;

public interface CartService {

	List<CartDTO> cartList(CartDTO dto);

	List<CartDTO> testList();

	public void insertCart(CartDTO dto);

	public int pointCheck(String userid);

	public void buyLecture(String userid, int price);

	public void insertLectureBox(String userid, String nickname, String cell_type, String lecture_idx, String main_img);
	
	public void deleteAll(String userid);//장바구니 전체지우기

	public int cartCheck(CartDTO dto);

	public void delete(String cart_idx);//장바구니 개별 상품 삭제

	public void buyCart(String userid, String lecture_idx);

	public void pointCharge(String userid);
}
