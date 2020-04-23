package com.TeamProject.Kdemy.model.admin.dao;

import java.util.List;

import com.TeamProject.Kdemy.model.admin.dto.AdminDTO;
import com.TeamProject.Kdemy.model.admin.dto.MainDTO;
import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

public interface AdminDAO {
	public List<AdminDTO> list();
	public void insertAdmin(AdminDTO dto);
	public AdminDTO viewAdmin(String admin_id);
	public void updateAdmin(AdminDTO dto);
	public void deleteAdmin(String admin_id);
	public List<MainDTO> resoucelist();
	public void mainChange(MainDTO dto);
	public String resoucelist1(String column);
	public AdminDTO adminLogin(MemberDTO dto);
	public int idCheck(String admin_id);
}