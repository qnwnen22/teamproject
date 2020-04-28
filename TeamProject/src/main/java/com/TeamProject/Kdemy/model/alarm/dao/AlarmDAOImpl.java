package com.TeamProject.Kdemy.model.alarm.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.alarm.dto.AlarmDTO;

@Repository
public class AlarmDAOImpl implements AlarmDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public void insertAlarm(AlarmDTO dto) {
		sqlSession.insert("alarm.insertAlarm",dto);
	}

	@Override
	public void alarmCheck(int alarm_id) {
		sqlSession.update("alarm.alarmCheck",alarm_id);
	}

	@Override
	public List<AlarmDTO> alarmList(String userid, int start, int end) {
		  Map<String, Object> map=new HashMap<>();
	      map.put("userid", userid);
	      map.put("start", start);
	      map.put("end",end);
		return sqlSession.selectList("alarm.alarmList",userid);
	}

	@Override
	public int countalarmList(String userid) {
		return sqlSession.selectOne("alarm.countalarmList",userid);
	}

}
