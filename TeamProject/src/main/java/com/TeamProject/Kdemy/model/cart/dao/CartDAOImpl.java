package com.TeamProject.Kdemy.model.cart.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.cart.dto.CartDTO;

@Repository
public class CartDAOImpl implements CartDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<CartDTO> cartList(CartDTO dto) {
		return sqlSession.selectList("cart.cartList",dto);
	}

	@Override
	public List<CartDTO> testList() {
		return sqlSession.selectList("cart.testList");
	}

	@Override
	public void deleteCart(String userid, String lecture_idx) {
		HashMap<String,Object> map=new HashMap<>();
		map.put("userid", userid);
		map.put("lecture_idx", lecture_idx);
		sqlSession.delete("cart.deleteCart",map);
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
	public void insertLectureBox(String userid, String cell_type, String lecture_idx) {
		HashMap<String,Object> map=new HashMap<>();
		map.put("userid", userid);
		map.put("cell_type", cell_type);
		map.put("lecture_idx", lecture_idx);
		sqlSession.insert("cart.insertLectureBox",map);
	}

	@Override
	public int cartCheck(CartDTO dto) {
		return sqlSession.selectOne("cart.cartCheck",dto);
	}

}
