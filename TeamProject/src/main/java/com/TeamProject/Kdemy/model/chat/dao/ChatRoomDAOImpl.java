package com.TeamProject.Kdemy.model.chat.dao;

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

}
