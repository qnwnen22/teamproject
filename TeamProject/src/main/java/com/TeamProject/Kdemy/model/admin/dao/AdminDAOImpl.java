package com.TeamProject.Kdemy.model.admin.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.admin.dto.AdminDTO;
import com.TeamProject.Kdemy.model.admin.dto.MainDTO;
@Repository
public class AdminDAOImpl implements AdminDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<AdminDTO> list() {
		return sqlSession.selectList("admin.adminList");
	}
	@Override
	public void insertAdmin(AdminDTO dto) {
		sqlSession.insert("admin.insertAdmin", dto);
	}
	@Override
	public AdminDTO viewAdmin(String admin_id) {
		return sqlSession.selectOne("admin.viewAdmin", admin_id);
	}
	@Override
	public void updateAdmin(AdminDTO dto) {
		sqlSession.update("admin.updateAdmin", dto);
	}
	@Override
	public void deleteAdmin(String admin_id) {
		sqlSession.delete("admin.deleteAdmin", admin_id);
	}
	@Override
	public List<MainDTO> resoucelist() {
		return sqlSession.selectList("admin.resouceList");
	}
	@Override
	public void mainChange(MainDTO dto) {
		sqlSession.update("admin.mainChange", dto);
	}
}