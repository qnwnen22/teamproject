package com.TeamProject.Kdemy.model.chat.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.chat.dto.ChatRoomDTO;

@Repository
public class ChatRoomDAOImpl implements ChatRoomDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public void createRoom(ChatRoomDTO dto) throws Exception{
		sqlSession.insert("chatroom.createRoom",dto);
	}

	@Override
	public List<ChatRoomDTO> chatRoomListAll() throws Exception {
		return sqlSession.selectList("chatroom.chatRoomListAll");
	}

	@Override
	public ChatRoomDTO chatRoomView(int chatroom_id) throws Exception {
		ChatRoomDTO dto=sqlSession.selectOne("chatroom.chatRoomView",chatroom_id);
		return dto;
	}

	@Override
	public int checkRoom(ChatRoomDTO dto) throws Exception {
		return sqlSession.selectOne("chatroom.checkRoom",dto);
	}

	@Override
	public void insertMessage(int chatroom_id, String chatmsg) {
		HashMap<String, Object> map=new HashMap<>();
	      map.put("chatroom_id", chatroom_id);
	      map.put("chatmsg", chatmsg);
		sqlSession.insert("chatroom.insertMessage",map);	
	}

	@Override
	public List<ChatRoomDTO> messageList(ChatRoomDTO dto) {
		return sqlSession.selectList("chatroom.messageList",dto);
	}

	@Override
	public void roomUpdate(ChatRoomDTO dto) throws Exception {
		sqlSession.update("chatroom.roomUpdate",dto);
	}

	@Override
	public void clickRoom(int chatroom_id) throws Exception {
	  sqlSession.update("chatroom.clickRoom",chatroom_id);	
	}

	

}
