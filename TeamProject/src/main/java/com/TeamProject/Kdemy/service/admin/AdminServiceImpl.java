package com.TeamProject.Kdemy.service.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.admin.dao.AdminDAO;
import com.TeamProject.Kdemy.model.admin.dto.AdminDTO;
import com.TeamProject.Kdemy.model.admin.dto.MainDTO;
import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {
	@Inject
	AdminDAO adminDao;
	
	@Override
	public List<AdminDTO> list() {
		return adminDao.list();
	}
	@Override
	public void insertAdmin(AdminDTO dto) {
		adminDao.insertAdmin(dto);
	}
	@Override
	public AdminDTO viewAdmin(String admin_id) {
		return adminDao.viewAdmin(admin_id);
	}
	@Override
	public void updateAdmin(AdminDTO dto) {
		adminDao.updateAdmin(dto);
	}
	@Override
	public void deleteAdmin(String admin_id) {
		adminDao.deleteAdmin(admin_id);
	}
	@Override
	public List<MainDTO> resoucelist(){
		return adminDao.resoucelist();
	}
	@Override
	public void mainChange(MainDTO dto) {
		adminDao.mainChange(dto);
	}
	@Override
	public String resoucelist1(String column) {
		return adminDao.resoucelist1(column);
	}
	@Override
	public AdminDTO adminLogin(MemberDTO dto) {
		return adminDao.adminLogin(dto);
	}
	@Override
	public int idCheck(String admin_id) {
		return adminDao.idCheck(admin_id);
	}
}