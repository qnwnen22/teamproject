package com.TeamProject.Kdemy.service.admin;

import java.util.List;

import com.TeamProject.Kdemy.model.admin.dto.AdminDTO;
import com.TeamProject.Kdemy.model.admin.dto.MainDTO;

public interface AdminService {
	public List<AdminDTO> list();
	public void insertAdmin(AdminDTO dto);
	public AdminDTO viewAdmin(String admin_id);
	public void updateAdmin(AdminDTO dto);
	public void deleteAdmin(String admin_id);
	public List<MainDTO> resoucelist();
	public void mainChange(MainDTO dto);
}