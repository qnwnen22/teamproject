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
	public List<PackagesDTO> list(int start, int end) {
		return packagesDao.list(start, end);
	}
	@Override
	public PackagesDTO viewPackages(String packages_name) {
		return packagesDao.viewPackages(packages_name);
	}
	@Override
	public void updatePackages(PackagesDTO dto) {
		packagesDao.updatePackages(dto);
	}
	@Override
	public void deletePackages(String packages_name) {
		packagesDao.deletePackages(packages_name);
	}

	@Override
	public int countPackages() {
		return packagesDao.countPackages();
	}
}