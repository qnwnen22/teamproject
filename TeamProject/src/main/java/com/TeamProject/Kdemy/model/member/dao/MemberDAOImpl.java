package com.TeamProject.Kdemy.model.member.dao;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sql;
	
	@Override
	public String login(MemberDTO dto, HttpSession session) {
		sql.selectOne("member/login",dto);
		String name=dto.getName();
		String userid=dto.getUserid();
		HashMap<String, Object> map=new HashMap<>();
				
		return "";
	}


}
