package com.TeamProject.Kdemy.model.teacher.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class TeacherDTO {

//	--개인정보 칼럼
	private int teacher_num; //강사 번호(리스트 출력용)
	private String userid; //멤버 아이디 userid
	private String username; //멤버 이름 username
	private String nickname; //닉네임
	private String teacher_thumbnail; //강사 등록용 프로필 사진 
//	--학력 칼럼
	private String finalEducation; //최종학력
//	--자격증 칼럼
	private String spec1; //자격증1 이름
	private String spec1_getDate; //취득일자
	private String spec1_img; // 자격증 이미지
	
	private String spec2; //
	private String spec2_getDate; //
	private String spec2_img; //
	
	private String spec3; //te
	private String spec3_getDate; //
	private String spec3_img; //
	
	private String spec4; //
	private String spec4_getDate; //
	private String spec4_img; //
	
	private String spec5; //
	private String spec5_getDate; //
	private String spec5_img; //
//	-- 경력 칼럼
	private String career; //
	private Date request_date; //신청 날짜
	
//	파일 업로드 처리용 변수
	 //썸네일용 파일
	private MultipartFile thumbnailFile;
	// 자격증이미지용 파일
	private MultipartFile spec1File;
	private MultipartFile spec2File; 
	private MultipartFile spec3File; 
	private MultipartFile spec4File; 
	private MultipartFile spec5File; 
	
	private String spec1_y;
	private String spec1_m;
	private String spec1_d;
	
	private String spec2_y;
	private String spec2_m;
	private String spec2_d;
	
	private String spec3_y;
	private String spec3_m;
	private String spec3_d;
	
	private String spec4_y;
	private String spec4_m;
	private String spec4_d;
	
	private String spec5_y;
	private String spec5_m;
	private String spec5_d;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTeacher_thumbnail() {
		return teacher_thumbnail;
	}
	public void setTeacher_thumbnail(String teacher_thumbnail) {
		this.teacher_thumbnail = teacher_thumbnail;
	}
	public String getFinalEducation() {
		return finalEducation;
	}
	public void setFinalEducation(String finalEducation) {
		this.finalEducation = finalEducation;
	}
	public String getSpec1() {
		return spec1;
	}
	public void setSpec1(String spec1) {
		this.spec1 = spec1;
	}
	public String getSpec1_getDate() {
		return spec1_getDate;
	}
	public void setSpec1_getDate(String spec1_getDate) {
		this.spec1_getDate = spec1_getDate;
	}
	public String getSpec1_img() {
		return spec1_img;
	}
	public void setSpec1_img(String spec1_img) {
		this.spec1_img = spec1_img;
	}
	public String getSpec2() {
		return spec2;
	}
	public void setSpec2(String spec2) {
		this.spec2 = spec2;
	}
	public String getSpec2_getDate() {
		return spec2_getDate;
	}
	public void setSpec2_getDate(String spec2_getDate) {
		this.spec2_getDate = spec2_getDate;
	}
	public String getSpec2_img() {
		return spec2_img;
	}
	public void setSpec2_img(String spec2_img) {
		this.spec2_img = spec2_img;
	}
	public String getSpec3() {
		return spec3;
	}
	public void setSpec3(String spec3) {
		this.spec3 = spec3;
	}
	public String getSpec3_getDate() {
		return spec3_getDate;
	}
	public void setSpec3_getDate(String spec3_getDate) {
		this.spec3_getDate = spec3_getDate;
	}
	public String getSpec3_img() {
		return spec3_img;
	}
	public void setSpec3_img(String spec3_img) {
		this.spec3_img = spec3_img;
	}
	public String getSpec4() {
		return spec4;
	}
	public void setSpec4(String spec4) {
		this.spec4 = spec4;
	}
	public String getSpec4_getDate() {
		return spec4_getDate;
	}
	public void setSpec4_getDate(String spec4_getDate) {
		this.spec4_getDate = spec4_getDate;
	}
	public String getSpec4_img() {
		return spec4_img;
	}
	public void setSpec4_img(String spec4_img) {
		this.spec4_img = spec4_img;
	}
	public String getSpec5() {
		return spec5;
	}
	public void setSpec5(String spec5) {
		this.spec5 = spec5;
	}
	public String getSpec5_getDate() {
		return spec5_getDate;
	}
	public void setSpec5_getDate(String spec5_getDate) {
		this.spec5_getDate = spec5_getDate;
	}
	public String getSpec5_img() {
		return spec5_img;
	}
	public void setSpec5_img(String spec5_img) {
		this.spec5_img = spec5_img;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public Date getRequest_date() {
		return request_date;
	}
	public void setRequest_date(Date request_date) {
		this.request_date = request_date;
	}
	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}
	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}
	public MultipartFile getSpec1File() {
		return spec1File;
	}
	public void setSpec1File(MultipartFile spec1File) {
		this.spec1File = spec1File;
	}
	public MultipartFile getSpec2File() {
		return spec2File;
	}
	public void setSpec2File(MultipartFile spec2File) {
		this.spec2File = spec2File;
	}
	public MultipartFile getSpec3File() {
		return spec3File;
	}
	public void setSpec3File(MultipartFile spec3File) {
		this.spec3File = spec3File;
	}
	public MultipartFile getSpec4File() {
		return spec4File;
	}
	public void setSpec4File(MultipartFile spec4File) {
		this.spec4File = spec4File;
	}
	public MultipartFile getSpec5File() {
		return spec5File;
	}
	public void setSpec5File(MultipartFile spec5File) {
		this.spec5File = spec5File;
	}
	public String getSpec1_y() {
		return spec1_y;
	}
	public void setSpec1_y(String spec1_y) {
		this.spec1_y = spec1_y;
	}
	public String getSpec1_m() {
		return spec1_m;
	}
	public void setSpec1_m(String spec1_m) {
		this.spec1_m = spec1_m;
	}
	public String getSpec1_d() {
		return spec1_d;
	}
	public void setSpec1_d(String spec1_d) {
		this.spec1_d = spec1_d;
	}
	public String getSpec2_y() {
		return spec2_y;
	}
	public void setSpec2_y(String spec2_y) {
		this.spec2_y = spec2_y;
	}
	public String getSpec2_m() {
		return spec2_m;
	}
	public void setSpec2_m(String spec2_m) {
		this.spec2_m = spec2_m;
	}
	public String getSpec2_d() {
		return spec2_d;
	}
	public void setSpec2_d(String spec2_d) {
		this.spec2_d = spec2_d;
	}
	public String getSpec3_y() {
		return spec3_y;
	}
	public void setSpec3_y(String spec3_y) {
		this.spec3_y = spec3_y;
	}
	public String getSpec3_m() {
		return spec3_m;
	}
	public void setSpec3_m(String spec3_m) {
		this.spec3_m = spec3_m;
	}
	public String getSpec3_d() {
		return spec3_d;
	}
	public void setSpec3_d(String spec3_d) {
		this.spec3_d = spec3_d;
	}
	public String getSpec4_y() {
		return spec4_y;
	}
	public void setSpec4_y(String spec4_y) {
		this.spec4_y = spec4_y;
	}
	public String getSpec4_m() {
		return spec4_m;
	}
	public void setSpec4_m(String spec4_m) {
		this.spec4_m = spec4_m;
	}
	public String getSpec4_d() {
		return spec4_d;
	}
	public void setSpec4_d(String spec4_d) {
		this.spec4_d = spec4_d;
	}
	public String getSpec5_y() {
		return spec5_y;
	}
	public void setSpec5_y(String spec5_y) {
		this.spec5_y = spec5_y;
	}
	public String getSpec5_m() {
		return spec5_m;
	}
	public void setSpec5_m(String spec5_m) {
		this.spec5_m = spec5_m;
	}
	public String getSpec5_d() {
		return spec5_d;
	}
	public void setSpec5_d(String spec5_d) {
		this.spec5_d = spec5_d;
	}
	@Override
	public String toString() {
		return "TeacherDTO [teacher_num=" + teacher_num + ", userid=" + userid + ", username=" + username
				+ ", nickname=" + nickname + ", teacher_thumbnail=" + teacher_thumbnail + ", finalEducation="
				+ finalEducation + ", spec1=" + spec1 + ", spec1_getDate=" + spec1_getDate + ", spec1_img=" + spec1_img
				+ ", spec2=" + spec2 + ", spec2_getDate=" + spec2_getDate + ", spec2_img=" + spec2_img + ", spec3="
				+ spec3 + ", spec3_getDate=" + spec3_getDate + ", spec3_img=" + spec3_img + ", spec4=" + spec4
				+ ", spec4_getDate=" + spec4_getDate + ", spec4_img=" + spec4_img + ", spec5=" + spec5
				+ ", spec5_getDate=" + spec5_getDate + ", spec5_img=" + spec5_img + ", career=" + career
				+ ", request_date=" + request_date + ", thumbnailFile=" + thumbnailFile + ", spec1File=" + spec1File
				+ ", spec2File=" + spec2File + ", spec3File=" + spec3File + ", spec4File=" + spec4File + ", spec5File="
				+ spec5File + ", spec1_y=" + spec1_y + ", spec1_m=" + spec1_m + ", spec1_d=" + spec1_d + ", spec2_y="
				+ spec2_y + ", spec2_m=" + spec2_m + ", spec2_d=" + spec2_d + ", spec3_y=" + spec3_y + ", spec3_m="
				+ spec3_m + ", spec3_d=" + spec3_d + ", spec4_y=" + spec4_y + ", spec4_m=" + spec4_m + ", spec4_d="
				+ spec4_d + ", spec5_y=" + spec5_y + ", spec5_m=" + spec5_m + ", spec5_d=" + spec5_d + "]";
	}
}
