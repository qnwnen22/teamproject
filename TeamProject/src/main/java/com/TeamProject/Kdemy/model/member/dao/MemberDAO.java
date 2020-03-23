package com.TeamProject.Kdemy.model.member.dao;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

@Repository
public interface MemberDAO {

	String login(MemberDTO dto, HttpSession session);
}
