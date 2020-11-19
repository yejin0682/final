package com.auction.handler;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Repository;

@Repository
public class ChatRoomRepository {
	private Map<String,ChatRoom> chatRoomMap;
	
	public ChatRoomRepository() {
		chatRoomMap = new LinkedHashMap<String, ChatRoom>();
	}
	public ChatRoomRepository(Map<String, ChatRoom> chatRoomMap) {
		this.chatRoomMap = chatRoomMap;
	}

	// 방전체 목록 출력
	public List<ChatRoom> findAllRoom(){
		List chatRooms = new ArrayList<>(chatRoomMap.values());
		Collections.reverse(chatRooms);
		return chatRooms;
	}
	
	//방번호 전송
	public ChatRoom findRoomById(String id) {
		return chatRoomMap.get(id);
	}
	
	//새로운 방 생성
	public ChatRoom createChatRoom(String name,String user,String userId) {
		ChatRoom chatRoom = ChatRoom.create(name,user,userId);
		chatRoomMap.put(chatRoom.getRoomId(), chatRoom);
		return chatRoom;
	}
}
