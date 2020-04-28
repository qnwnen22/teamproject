package com.TeamProject.Kdemy.model.chat.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class ChatRoomDTO {
	private int chatroom_id;
	private String chatroom_name;
	private String create_user_id;
	private String admin_id;
	private String chatmsg;
	private String chatalarm;
	private Date room_join_date;
	
	private Date chatdate;
	

}
