package com.TeamProject.Kdemy.model.packages.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.admin.dto.AdminDTO;
import com.TeamProject.Kdemy.model.packages.dto.PackagesDTO;
@Repository
public class PackagesDAOImpl implements PackagesDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<PackagesDTO> list() {
		return sqlSession.selectList("packages.packagesList");
	}
	
	@Override
	public void insertpackages(PackagesDTO dto) throws Exception{
		sqlSession.insert("packages.insertpackages",dto);
	}
	
	@Override
	public PackagesDTO viewPackages(String packages_name) {
		return sqlSession.selectOne("packages.viewPackages", packages_name);
	}
}