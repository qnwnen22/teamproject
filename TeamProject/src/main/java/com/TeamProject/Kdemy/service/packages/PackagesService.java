package com.TeamProject.Kdemy.service.packages;

import java.util.List;

import com.TeamProject.Kdemy.model.packages.dto.PackagesDTO;

public interface PackagesService {
	public List<PackagesDTO> list();
	public void insertpackages(PackagesDTO dto) throws Exception;
	public PackagesDTO viewPackages(String packages_name);
	public void updatePackages(PackagesDTO dto);
	public void deletePackages(String packages_name);
}