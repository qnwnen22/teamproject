package com.TeamProject.Kdemy.model.cart.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.cart.dto.CartDTO;
import com.TeamProject.Kdemy.model.lecture.dto.LectureBoxDTO;

@Repository
public class CartDAOImpl implements CartDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<CartDTO> cartList(CartDTO dto) {
		return sqlSession.selectList("cart.cartList",dto);
	}


	@Override
	public void insertCart(CartDTO dto) {
		sqlSession.insert("cart.insertCart",dto);
	}

	@Override
	public int pointCheck(String userid) {
		return sqlSession.selectOne("cart.pointCheck",userid);
	}

	@Override
	public void buyLecture(String userid, int price) {
		HashMap<String,Object> map=new HashMap<>();
		map.put("userid", userid);
		map.put("price", price);
		sqlSession.update("cart.buyLecture",map);
	}

	@Override
	public void insertLectureBox(String userid, String nickname, String cell_type, String lecture_idx, String main_img) {
		HashMap<String,Object> map=new HashMap<>();
		map.put("main_img", main_img);
		map.put("userid", userid);
		map.put("nickname", nickname);
		map.put("cell_type", cell_type);
		map.put("lecture_idx", lecture_idx);
		map.put("nickname", nickname);
		sqlSession.insert("cart.insertLectureBox",map);
	}
	
	@Override
	public List<CartDTO> testList() {
		return sqlSession.selectList("cart.testList");
	}

	@Override
	public int cartCheck(CartDTO dto) {
		return sqlSession.selectOne("cart.cartCheck",dto);
	}
	public void deleteAll(String userid) {
		sqlSession.delete("cart.deleteAll",userid);
		
	}

	@Override
	public void delete(String cart_idx) {
		sqlSession.delete("cart.delete",cart_idx);
		
	}

	@Override
	public void buyCart(String userid, String lecture_idx) {
		HashMap<String,Object> map=new HashMap<>();
		map.put("userid", userid);
		map.put("lecture_idx", lecture_idx);
		sqlSession.delete("cart.buyCart",map);
	}

	@Override
	public void pointCharge(String userid) {
		sqlSession.update("cart.pointCharge",userid);
	}

}
