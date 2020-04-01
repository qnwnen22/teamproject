package com.TeamProject.Kdemy.model.teacher.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

//import java.util.Date;

//import org.springframework.web.multipart.MultipartFile;

public class TeacherDTO {

	private int teacher_num; //리스트 출력용 강사 번호
	private String userid; //kdemymember 사용자 아이디
	private String username; //사용자 이름
	private String teacher_profileImagePath; //사용자 프로필 사진 
	private String highschool; //고등학교
	private String university; //대학교
	private String spec1; //자격증1 ( 최대 n개까지 추가할 수 있도록 구현할 예정 )
	private String spec1_img; //자격증1 이미지 파일
	private String spec1_getDate; //자격증 취득일자
	private Date request_date; //선생님 권한을 신청한 날짜
	
	private MultipartFile file1;
	private MultipartFile file2;
	private MultipartFile file3;
	private MultipartFile file4;
	private MultipartFile file5;
	private MultipartFile file6;
	public int getTeacher_num() {
		return teacher_num;
	}
	public void setTeacher_num(int teacher_num) {
		this.teacher_num = teacher_num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTeacher_profileImagePath() {
		return teacher_profileImagePath;
	}
	public void setTeacher_profileImagePath(String teacher_profileImagePath) {
		this.teacher_profileImagePath = teacher_profileImagePath;
	}
	public String getHighschool() {
		return highschool;
	}
	public void setHighschool(String highschool) {
		this.highschool = highschool;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public String getSpec1() {
		return spec1;
	}
	public void setSpec1(String spec1) {
		this.spec1 = spec1;
	}
	public String getSpec1_img() {
		return spec1_img;
	}
	public void setSpec1_img(String spec1_img) {
		this.spec1_img = spec1_img;
	}
	public String getSpec1_getDate() {
		return spec1_getDate;
	}
	public void setSpec1_getDate(String spec1_getDate) {
		this.spec1_getDate = spec1_getDate;
	}
	public Date getRequest_date() {
		return request_date;
	}
	public void setRequest_date(Date request_date) {
		this.request_date = request_date;
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
	public MultipartFile getFile3() {
		return file3;
	}
	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}
	public MultipartFile getFile4() {
		return file4;
	}
	public void setFile4(MultipartFile file4) {
		this.file4 = file4;
	}
	public MultipartFile getFile5() {
		return file5;
	}
	public void setFile5(MultipartFile file5) {
		this.file5 = file5;
	}
	public MultipartFile getFile6() {
		return file6;
	}
	public void setFile6(MultipartFile file6) {
		this.file6 = file6;
	}
	@Override
	public String toString() {
		return "TeacherDTO [teacher_num=" + teacher_num + ", userid=" + userid + ", username=" + username
				+ ", teacher_profileImagePath=" + teacher_profileImagePath + ", highschool=" + highschool
				+ ", university=" + university + ", spec1=" + spec1 + ", spec1_img=" + spec1_img + ", spec1_getDate="
				+ spec1_getDate + ", request_date=" + request_date + ", file1=" + file1 + ", file2=" + file2
				+ ", file3=" + file3 + ", file4=" + file4 + ", file5=" + file5 + ", file6=" + file6 + "]";
	}
	public TeacherDTO(int teacher_num, String userid, String username, String teacher_profileImagePath,
			String highschool, String university, String spec1, String spec1_img, String spec1_getDate,
			Date request_date, MultipartFile file1, MultipartFile file2, MultipartFile file3, MultipartFile file4,
			MultipartFile file5, MultipartFile file6) {
		this.teacher_num = teacher_num;
		this.userid = userid;
		this.username = username;
		this.teacher_profileImagePath = teacher_profileImagePath;
		this.highschool = highschool;
		this.university = university;
		this.spec1 = spec1;
		this.spec1_img = spec1_img;
		this.spec1_getDate = spec1_getDate;
		this.request_date = request_date;
		this.file1 = file1;
		this.file2 = file2;
		this.file3 = file3;
		this.file4 = file4;
		this.file5 = file5;
		this.file6 = file6;
	}
	
	public TeacherDTO() {
	}
}
