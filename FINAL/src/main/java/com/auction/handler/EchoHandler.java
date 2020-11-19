package com.auction.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.auction.vo.MemberVo;

public class EchoHandler extends TextWebSocketHandler{
	// �쎒 �냼耳� �꽭�뀡�쓣 ���옣�븷 由ъ뒪�듃 �깮�꽦
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	// �겢�씪�씠�뼵�듃 �뿰寃� �썑.
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		System.out.println(session.getAttributes());
//		Map<String,Object> map = session.getAttributes();
		if(sessionList.size()<=1) {
			sessionList.add(session);
		}else {
			System.out.println("2명 제한");
		}
//		sessionList.add((WebSocketSession) map.get("아이디"));
		logger.info("{} 연결됨",session.getId());
		System.out.println("입장:"+session.getId());
		Map<String,Object> map=session.getAttributes();
		MemberVo vo=(MemberVo) map.get("member");
		System.out.println("session아이디:"+vo.getID());
//		System.out.println("채팅방 입장자 : "+ session.getPrincipal().getName());
		for(int i=0; i<sessionList.size();i++) {
			System.out.println(sessionList.get(i));
		}
	}
	// �쎒 �냼耳� �꽌踰꾨줈 �뜲�씠�꽣 �쟾�넚
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}濡� 遺��꽣 {} 諛쏆쓬",session.getId(),message.getPayload());
		for(WebSocketSession sess : sessionList) {
			System.out.println(sess.getId());
				sess.sendMessage(new TextMessage(message.getPayload()+"\n"));
		}
	}
	// �뿰寃곗씠 �걡�뼱吏� 寃쎌슦
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		
		logger.info("{} �뿰寃� �걡源�.",session.getId());
//		System.out.println("梨꾪똿諛� �눜�옣�옄 :"+session.getPrincipal().getName());
		System.out.println("채팅퇴장:"+session.getId());
	}
	
}
