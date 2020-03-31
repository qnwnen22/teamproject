package com.TeamProject.Kdemy.model.teacher.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class TeacherDTO {
	
	private int lecture_idx; 
	private String cell_type; // 판매타입
	
	private String main_category; // 메인 카테고리
	private String sub_category; // 서브 카테고리
	private String userid; // 사용자 아이디
	private String subject; // 제목
	private String main_img; // 썸네일
	private String videofile; //; 비디오 파일 이름
	private String content; // 설명
	private Date upload_date; // 업로드 날짜
	private int price; // 가격
	private String lecture_date; // 강의 시작날짜
	private String lecture_start; // 강의 시작시간
	private String lecture_time; // 강의 시간
	private String lecture_postcode; // 강의 우편번호
	private String lecture_address; // 강의장 도로명 주소
	private String lecture_address2; // 상세 주소
	
	private MultipartFile file1;
	private MultipartFile file2;
	public int getLecture_idx() {
		return lecture_idx;
	}
	public void setLecture_idx(int lecture_idx) {
		this.lecture_idx = lecture_idx;
	}
	public String getCell_type() {
		return cell_type;
	}
	public void setCell_type(String cell_type) {
		this.cell_type = cell_type;
	}
	public String getMain_category() {
		return main_category;
	}
	public void setMain_category(String main_category) {
		this.main_category = main_category;
	}
	public String getSub_category() {
		return sub_category;
	}
	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getVideofile() {
		return videofile;
	}
	public void setVideofile(String videofile) {
		this.videofile = videofile;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getLecture_date() {
		return lecture_date;
	}
	public void setLecture_date(String lecture_date) {
		this.lecture_date = lecture_date;
	}
	public String getLecture_start() {
		return lecture_start;
	}
	public void setLecture_start(String lecture_start) {
		this.lecture_start = lecture_start;
	}
	public String getLecture_time() {
		return lecture_time;
	}
	public void setLecture_time(String lecture_time) {
		this.lecture_time = lecture_time;
	}
	public String getLecture_postcode() {
		return lecture_postcode;
	}
	public void setLecture_postcode(String lecture_postcode) {
		this.lecture_postcode = lecture_postcode;
	}
	public String getLecture_address() {
		return lecture_address;
	}
	public void setLecture_address(String lecture_address) {
		this.lecture_address = lecture_address;
	}
	public String getLecture_address2() {
		return lecture_address2;
	}
	public void setLecture_address2(String lecture_address2) {
		this.lecture_address2 = lecture_address2;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	@Override
	public String toString() {
		return "TeacherDTO [lecture_idx=" + lecture_idx + ", cell_type=" + cell_type + ", main_category="
				+ main_category + ", sub_category=" + sub_category + ", userid=" + userid + ", subject=" + subject
				+ ", main_img=" + main_img + ", videofile=" + videofile + ", content=" + content + ", upload_date="
				+ upload_date + ", price=" + price + ", lecture_date=" + lecture_date + ", lecture_start="
				+ lecture_start + ", lecture_time=" + lecture_time + ", lecture_postcode=" + lecture_postcode
				+ ", lecture_address=" + lecture_address + ", lecture_address2=" + lecture_address2 + ", file1=" + file1
				+ ", file2=" + file2 + "]";
	}
	public TeacherDTO(int lecture_idx, String cell_type, String main_category, String sub_category, String userid,
			String subject, String main_img, String videofile, String content, Date upload_date, int price,
			String lecture_date, String lecture_start, String lecture_time, String lecture_postcode,
			String lecture_address, String lecture_address2, MultipartFile file1, MultipartFile file2) {
		this.lecture_idx = lecture_idx;
		this.cell_type = cell_type;
		this.main_category = main_category;
		this.sub_category = sub_category;
		this.userid = userid;
		this.subject = subject;
		this.main_img = main_img;
		this.videofile = videofile;
		this.content = content;
		this.upload_date = upload_date;
		this.price = price;
		this.lecture_date = lecture_date;
		this.lecture_start = lecture_start;
		this.lecture_time = lecture_time;
		this.lecture_postcode = lecture_postcode;
		this.lecture_address = lecture_address;
		this.lecture_address2 = lecture_address2;
		this.file1 = file1;
		this.file2 = file2;
	}

	public TeacherDTO() {
	}	
	
}
