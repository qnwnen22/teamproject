package com.TeamProject.Kdemy.service.packages;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.packages.dao.PackagesDAO;
import com.TeamProject.Kdemy.model.packages.dto.PackagesDTO;

@Service
public class PackagesServiceImpl implements PackagesService {
	@Inject
	PackagesDAO packagesDao;
	
	@Override
	public void insertpackages(PackagesDTO dto) throws Exception{
		packagesDao.insertpackages(dto);
	}
	
	@Override
	public List<PackagesDTO> list() {
		return packagesDao.list();
	}
	@Override
	public PackagesDTO viewPackages(String packages_name) {
		return packagesDao.viewPackages(packages_name);
	}
}