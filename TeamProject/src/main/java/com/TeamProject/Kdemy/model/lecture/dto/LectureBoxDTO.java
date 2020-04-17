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
	private String nickname;
	private int lecture_idx;
	private Date buy_date;
	private String onlineChat;
	
<<<<<<< HEAD
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	public String getOnlineChat() {
		return onlineChat;
	}
	public void setOnlineChat(String onlineChat) {
		this.onlineChat = onlineChat;
	}
	@Override
	public String toString() {
		return "LectureBoxDTO [box_idx=" + box_idx + ", cell_type=" + cell_type + ", userid=" + userid + ", nickname="
				+ nickname + ", lecture_idx=" + lecture_idx + ", buy_date=" + buy_date + ", onlineChat=" + onlineChat
				+ "]";
	}
=======
//	조인용 추가 칼럼(lecture)
	private String main_category; //메인 카테고리
	private String sub_category; //서브 카테고리
	private String subject; //강의제목
	private String main_img; //썸네일
	private String videofile; //영상 파일 이름
	private String content; //설명
	private Date upload_date; //업로드 날짜
	private int price; //가격
	
	//여기서 부터는 실시간/현장 강의 용 칼럼 
	private String lecture_date; //강의 시작 날짜
	private String lecture_start; //강의 시작 시간
	private String lecture_time; //강의 총 시간
	private String lecture_address; //강의장 도로명 주소
	private String lecture_address2; //상세 주소
	
	
>>>>>>> branch 'master' of https://github.com/qnwnen22/teamproject.git
}
