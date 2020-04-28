package com.TeamProject.Kdemy.model.alarm.dao;

import java.util.List;

import com.TeamProject.Kdemy.model.alarm.dto.AlarmDTO;

public interface AlarmDAO {

	public void insertAlarm(AlarmDTO dto);
	
	public List<AlarmDTO> alarmList(String userid, int start, int end);
	
	public void alarmCheck(int alarm_id);

	public int countalarmList(String userid);

}
