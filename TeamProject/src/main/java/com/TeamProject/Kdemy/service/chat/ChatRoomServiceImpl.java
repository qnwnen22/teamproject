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


	@Override
	public int checkRoom(ChatRoomDTO dto) throws Exception {
		return chatRoomDao.checkRoom(dto);
	}


	@Override
	public void insertMessage(int chatroom_id, String chatmsg) {
		chatRoomDao.insertMessage(chatroom_id,chatmsg);
	}


	@Override
	public List<ChatRoomDTO> messageList(ChatRoomDTO dto) {
		return chatRoomDao.messageList(dto);
	}


	@Override
	public void roomUpdate(ChatRoomDTO dto) throws Exception {
		chatRoomDao.roomUpdate(dto);
	}


	@Override
	public void clickRoom(int chatroom_id) throws Exception {
			chatRoomDao.clickRoom(chatroom_id);
	}


	


	

}
