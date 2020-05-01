package com.TeamProject.Kdemy.model.packages.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.packages.dto.PackagesDTO;
@Repository
public class PackagesDAOImpl implements PackagesDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<PackagesDTO> list(int start, int end) {
		  HashMap<String, Object> map=new HashMap<>();
	      map.put("start", start);
	      map.put("end", end);
		return sqlSession.selectList("packages.packagesList", map);
	}
	
	@Override
	public void insertpackages(PackagesDTO dto) throws Exception{
		sqlSession.insert("packages.insertpackages",dto);
	}
	
	@Override
	public PackagesDTO viewPackages(String packages_name) {
		return sqlSession.selectOne("packages.viewPackages", packages_name);
	}
	@Override
	public void updatePackages(PackagesDTO dto) {
		sqlSession.update("packages.updatePackages", dto);
	}
	@Override
	public void deletePackages(String packages_name) {
		sqlSession.delete("packages.deletePackages", packages_name);
	}

	@Override
	public int countPackages() {
		return sqlSession.selectOne("packages.countPackages");
	}

	@Override
	public void purchasePackages(PackagesDTO dto, String orderId) {
		HashMap<String, Object> map=new HashMap<>();
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, dto.getPackages_date());
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = fm.format(cal.getTime());
		System.out.println(strDate);
		String packages_name = dto.getPackages_name();
		map.put("packages_end", strDate);
		map.put("packages_name",packages_name);
		map.put("orderId",orderId);
		sqlSession.update("packages.purchasePackages", map);
	}
}