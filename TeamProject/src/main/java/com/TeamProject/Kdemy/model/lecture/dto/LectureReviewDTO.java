package com.TeamProject.Kdemy.model.lecture.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class LectureReviewDTO {

	private String userid;
	private int lecture_idx;
	private String review;
	private int star;
	
}
