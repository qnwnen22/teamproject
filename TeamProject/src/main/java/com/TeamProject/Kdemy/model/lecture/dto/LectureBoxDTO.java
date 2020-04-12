package com.TeamProject.Kdemy.model.lecture.dto;

import java.util.Date;

public class LectureBoxDTO {
	
	private int box_idx;
	private String cell_type;
	private String userid;
	private int lecture_idx;
	private Date buy_date;
	public int getBox_idx() {
		return box_idx;
	}
	public void setBox_idx(int box_idx) {
		this.box_idx = box_idx;
	}
	public String getCell_type() {
		return cell_type;
	}
	public void setCell_type(String cell_type) {
		this.cell_type = cell_type;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getLecture_idx() {
		return lecture_idx;
	}
	public void setLecture_idx(int lecture_idx) {
		this.lecture_idx = lecture_idx;
	}
	public Date getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	@Override
	public String toString() {
		return "LectureBoxDTO [box_idx=" + box_idx + ", cell_type=" + cell_type + ", userid=" + userid
				+ ", lecture_idx=" + lecture_idx + ", buy_date=" + buy_date + "]";
	}
	
}
