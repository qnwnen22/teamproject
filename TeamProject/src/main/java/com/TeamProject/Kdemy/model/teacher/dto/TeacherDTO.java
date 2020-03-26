package com.TeamProject.Kdemy.model.teacher.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class TeacherDTO {
	
	private int lecture_idx; 
	private String cell_type;
	private String main_category;
	private String sub_category;
	private String userid; 
	private String subject;
	private String main_img;
	private String videofile;
	private String content;
	private Date upload_date;
	private int price;
	private String lecture_start;
	private String lecture_time;
	
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
				+ upload_date + ", price=" + price + ", lecture_start=" + lecture_start + ", lecture_time="
				+ lecture_time + ", file1=" + file1 + ", file2=" + file2 + "]";
	}
	public TeacherDTO(int lecture_idx, String cell_type, String main_category, String sub_category, String userid,
			String subject, String main_img, String videofile, String content, Date upload_date, int price,
			String lecture_start, String lecture_time, MultipartFile file1, MultipartFile file2) {
		
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
		this.lecture_start = lecture_start;
		this.lecture_time = lecture_time;
		this.file1 = file1;
		this.file2 = file2;
	}
	public TeacherDTO() {
	}
	
	
	
	
	
}
