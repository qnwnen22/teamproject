package com.TeamProject.Kdemy.model.packages.dao;

import java.util.List;

import com.TeamProject.Kdemy.model.admin.dto.AdminDTO;
import com.TeamProject.Kdemy.model.packages.dto.PackagesDTO;

public interface PackagesDAO {
	public List<PackagesDTO> list();
	public void insertpackages(PackagesDTO dto) throws Exception;
	public PackagesDTO viewPackages(String packages_name);
}