package com.TeamProject.Kdemy.service.alarm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.alarm.dao.AlarmDAO;
import com.TeamProject.Kdemy.model.alarm.dto.AlarmDTO;

@Service
public class AlarmServiceImpl implements AlarmService {
	
	@Inject
	AlarmDAO alarmDAO;

	@Override
	public void insertAlarm(AlarmDTO dto) {
		alarmDAO.insertAlarm(dto);
	}
	
	@Override
	public void alarmCheck(int alarm_id) {
		alarmDAO.alarmCheck(alarm_id);
	}

	@Override
	public List<AlarmDTO> alarmList(String userid, int start, int end) {
		return alarmDAO.alarmList(userid,start,end);
	}

	@Override
	public int countalarmList(String userid) {
		return alarmDAO.countalarmList(userid);
	}

}
