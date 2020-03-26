package com.TeamProject.Kdemy.service.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.admin.dao.AdminDAO;
import com.TeamProject.Kdemy.model.admin.dto.AdminDTO;

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
}