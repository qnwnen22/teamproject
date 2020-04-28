package com.TeamProject.Kdemy.model.alarm.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AlarmDTO {
	private int alarm_id; 
	private String sender;// 보내는사람
	private String target;// 받는사람
	private String alarmmsg;// 메시지
	private String alarmcheck;// 알람 확인
	private Date alarmdate;// 메시지날짜

}
