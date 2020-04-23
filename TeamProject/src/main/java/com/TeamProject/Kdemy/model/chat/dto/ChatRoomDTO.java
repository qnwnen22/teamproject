package com.TeamProject.Kdemy.model.chat.dto;

import java.util.Date;

public class ChatRoomDTO {
	private int chatroom_id;
	private String chatroom_name;
	private String create_user_id;
	private String join_user_id;
	private int CLASS_class_id;
	private Date room_join_date;
	
	private String userid;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getChatroom_id() {
		return chatroom_id;
	}
	public void setChatroom_id(int chatroom_id) {
		this.chatroom_id = chatroom_id;
	}
	public String getChatroom_name() {
		return chatroom_name;
	}
	public void setChatroom_name(String chatroom_name) {
		this.chatroom_name = chatroom_name;
	}
	public String getCreate_user_id() {
		return create_user_id;
	}
	public void setCreate_user_id(String create_user_id) {
		this.create_user_id = create_user_id;
	}
	public String getJoin_user_id() {
		return join_user_id;
	}
	public void setJoin_user_id(String join_user_id) {
		this.join_user_id = join_user_id;
	}
	public int getCLASS_class_id() {
		return CLASS_class_id;
	}
	public void setCLASS_class_id(int cLASS_class_id) {
		CLASS_class_id = cLASS_class_id;
	}
	public Date getRoom_join_date() {
		return room_join_date;
	}
	public void setRoom_join_date(Date room_join_date) {
		this.room_join_date = room_join_date;
	}
	
	@Override
	public String toString() {
		return "ChatRoomDTO [chatroom_id=" + chatroom_id + ", chatroom_name=" + chatroom_name + ", create_user_id="
				+ create_user_id + ", join_user_id=" + join_user_id + ", CLASS_class_id=" + CLASS_class_id
				+ ", room_join_date=" + room_join_date + ", userid=" + userid + "]";
	}
	
	
	

}
