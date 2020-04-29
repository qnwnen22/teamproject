package com.TeamProject.Kdemy.model.packages.dao;

import java.util.List;

import com.TeamProject.Kdemy.model.packages.dto.PackagesDTO;

public interface PackagesDAO {
	public List<PackagesDTO> list(int start, int end);
	public void insertpackages(PackagesDTO dto) throws Exception;
	public PackagesDTO viewPackages(String packages_name);
	public void updatePackages(PackagesDTO dto);
	public void deletePackages(String packages_name);
	public int countPackages();
}