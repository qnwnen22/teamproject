package com.TeamProject.Kdemy.model.lecture.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class LectureBoxDTO {
	
	private int box_idx;
	private String cell_type;
	private String userid;
	private int lecture_idx;
	private Date buy_date;
	
}
