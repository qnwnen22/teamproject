package com.TeamProject.Kdemy.service.chat;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.chat.dao.ChatRoomDAO;
import com.TeamProject.Kdemy.model.chat.dto.ChatRoomDTO;

@Service
public class ChatRoomServiceImpl implements ChatRoomService {
	
	@Inject
	ChatRoomDAO chatRoomDao;
	

	@Override
	public void createRoom(ChatRoomDTO dto) throws Exception {
		chatRoomDao.createRoom(dto);
	}


	@Override
	public List<ChatRoomDTO> chatRoomListAll() throws Exception {
		return chatRoomDao.chatRoomListAll();
	}


	@Override
	public ChatRoomDTO chatRoomView(int chatroom_id) throws Exception {
		return chatRoomDao.chatRoomView(chatroom_id);
	}

}
