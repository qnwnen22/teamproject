package com.TeamProject.Kdemy.model.chat.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class ChatMessageDTO {

	
	 // 메시지 타입 : 입장, 채팅
    public enum MessageType {
        ENTER, TALK, JOIN
    }
    private MessageType type; // 메시지 타입
    private String roomId; // 방번호
    private String sender; // 메시지 보낸사람
    private String message; // 메시지
    private long userCount; 
    
}

