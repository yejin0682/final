package com.kk.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.auction.handler.ChatRoom;
import com.auction.handler.ChatRoomRepository;
import com.auction.vo.ChatRoomForm;

@Controller
public class ChatController {
	@Autowired
	private ChatRoomRepository chatRoomRepository;
	
		@RequestMapping(value = "/rooms")
	    public String rooms(Model model){
	        model.addAttribute("rooms",chatRoomRepository.findAllRoom());
	        return "rooms";
	    }
		// 방번호찾아서 들어감
		@RequestMapping(value = "/room")
	    public String room(String id, Model model){
	        ChatRoom room = chatRoomRepository.findRoomById(id);
	        model.addAttribute("room",room);
	        return "room";
	    }
//		@RequestMapping(value = "/new")
//	    public String make(Model model){
//	        ChatRoomForm form = new ChatRoomForm();
//	        model.addAttribute("form",form);
//	        return "newRoom";
//	    }
		//새로운 채팅방 생성
		@RequestMapping(value = "/new")
	    public String makeRoom(ChatRoomForm form,Model model,HttpServletResponse response) throws IOException{
//			request.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");
			if(form.getUserId().equals("")) {
				out.println("<script>alert('로그인이 필요합니다.'); location.href='notice?offset=0';</script>");
				out.flush();
//				return "redirect:/notice?offset=0";
			}
			ChatRoom room=chatRoomRepository.createChatRoom(form.getName(),form.getUser(),form.getUserId());
	        model.addAttribute("room",room);
	        return "room";
	    }
}
