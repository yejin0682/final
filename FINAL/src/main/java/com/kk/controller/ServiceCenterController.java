package com.kk.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.auction.service.CommentService;
import com.auction.service.NoticeService;
import com.auction.service.QnaBoardService;
import com.auction.vo.CommentVo;
import com.auction.vo.NoticeVo;
import com.auction.vo.QnaBoardVo;

@Controller
public class ServiceCenterController {
	@Autowired
	QnaBoardService qnaBoardService;
	@Autowired
	CommentService commentService;
	@Autowired
	NoticeService noticeService;
	
	private static final Logger logger = LoggerFactory.getLogger(ServiceCenterController.class);
	@RequestMapping(value="/serviceCenter")
	public String serviceCenter() {
		return "serviceCenter";
	}
	
	@RequestMapping(value="/chatting")
	public String chatting(Model model) {
		return "chatting";
	}
	
//	@RequestMapping(value="/chatting")
//	public ModelAndView chat(ModelAndView mv,HttpSession session) {
//		System.out.println(session.getAttribute("아이디"));
//		mv.setViewName("chatting");
//		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		System.out.println("user name:"+user.getUsername());
//		System.out.println("normal chat page");
//		mv.addObject("userid",session.getAttribute("아이디"));
//		return mv;
//	}
	
	@RequestMapping(value="/qnaBoard")
	public String qnaBoard(Model model,int offset,String keyword,String searchMenu,HttpServletRequest request,HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length;i++) {
			if(cookies[i].getName().equals("qnaWrite") || cookies[i].getName().contains("qnaDetail")) {
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
		
		if(offset<0) {
			offset=0;
		}
		List<QnaBoardVo> list= null;
		List<QnaBoardVo> listAll = null;
		if((keyword == null && searchMenu ==null) || (keyword.equals("") && searchMenu.equals("")) ) {
			list =qnaBoardService.selectBoard(offset);
			listAll = qnaBoardService.selectBoardAll();
		}else {
			if(searchMenu.equals("title")) {
				list = qnaBoardService.searchTitle(keyword,offset);	
				listAll = qnaBoardService.searchTitleSize(keyword);
			}else if(searchMenu.equals("content")) {
				list = qnaBoardService.searchContent(keyword, offset);
				listAll = qnaBoardService.searchContentSize(keyword);
			}else if(searchMenu.equals("writer")) {
				list = qnaBoardService.searchWriter(keyword, offset);
				listAll = qnaBoardService.searchWriterSize(keyword);
			}else if(searchMenu.equals("titleAndContent")) {
				list = qnaBoardService.searchTitleAndContent(keyword, offset);
				listAll = qnaBoardService.searchTitleAndContentSize(keyword);
			}
		}
		int pageSize=0;
		if(listAll.size()>=10 && listAll.size()%10==0 ) {
			pageSize=listAll.size()/10;
		}else {
			if(listAll.size()==0) {
				pageSize=0;
			}else {
				pageSize=listAll.size()/10+1;
			}
		}
		int nowPage =offset/10;
		int startPage = nowPage/10*10+1; 
		int endPage = startPage+9; 
		if(nowPage/10 == pageSize/10) {
			endPage=pageSize;
		}
		model.addAttribute("searchMenu", searchMenu);
		model.addAttribute("ps",pageSize/10);
		model.addAttribute("sp",startPage/10);
		model.addAttribute("keyword", keyword);
		model.addAttribute("offset", offset);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("qnaBoard", list);
		return "qnaBoard";
	}
	
	@RequestMapping(value="/qnaDetail")
	public String content(Model model,int qbno,HttpServletRequest request,HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;
		
		for(int i=0; i<cookies.length;i++) {
			if(cookies[i].getName().equals("qnaDetail"+qbno)) {
				viewCookie=cookies[i];
			}
		}
		if(viewCookie==null) {
			Cookie newCookie = new Cookie("qnaDetail"+qbno, "|"+qbno+"|");
			response.addCookie(newCookie);
			qnaBoardService.updateHitcount(qbno);
		}
		
		QnaBoardVo vo =qnaBoardService.selectContent(qbno);
		List<CommentVo> commentList = commentService.selectCommentService(qbno);
		List<CommentVo> reCommentList = new ArrayList<CommentVo>();
		for(CommentVo comment : commentList) {
			if(comment.getLevel()==1) {
				reCommentList.add(comment);
			}
		}
		model.addAttribute("reComment",reCommentList);
		model.addAttribute("comment", commentList);
		model.addAttribute("detail", vo);
		return "qnaDetail";
	}
	
	@RequestMapping(value="/qnaWrite")
	public String qnaWrite() {
		return "qnaWrite";
	}
	
	@RequestMapping(value="/qnaWriteAction")
	public String qnaWriteAction(QnaBoardVo vo,Model model,HttpServletRequest request,HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;
		
		for(int i=0 ;i<cookies.length;i++) {
			if(cookies[i].getName().equals("qnaWrite")) {
				viewCookie=cookies[i];
			}
		}
		System.out.println("확인");
		if(viewCookie==null) {
			Cookie newCookie = new Cookie("qnaWrite","write");
			response.addCookie(newCookie);
			qnaBoardService.wirteBoardService(vo);
		}
		
		List<QnaBoardVo> list =qnaBoardService.selectBoardAll();
		int qbno = list.get(0).getQbno();
		QnaBoardVo detail = qnaBoardService.selectContent(qbno);
		List<CommentVo> commentList = commentService.selectCommentService(qbno);
		List<CommentVo> reCommentList = new ArrayList<CommentVo>();
		for(CommentVo comment : commentList) {
			if(comment.getLevel()==1) {
				reCommentList.add(comment);
			}
		}
		model.addAttribute("reComment",reCommentList);
		model.addAttribute("comment", commentList);
		model.addAttribute("detail", detail);
		
//		List<QnaBoardVo> list =qnaBoardService.selectBoard(0);
//		model.addAttribute("offset", 0);
//		model.addAttribute("startPage", 0);
//		model.addAttribute("endPage", 9);
//		model.addAttribute("qnaBoard", list);
		return "qnaDetail";
	}
	
	@RequestMapping(value="/notice")
	public String notice(Model model,int offset,String keyword,String searchMenu) {
		if(offset<0) {
			offset=0;
		}
		List<NoticeVo> list= null;
		List<NoticeVo> listAll = null;
		if((keyword == null && searchMenu ==null) || (keyword.equals("") && searchMenu.equals("")) ) {
			list =noticeService.selectBoard(offset);
			listAll = noticeService.selectBoardAll();
		}else {
			if(searchMenu.equals("title")) {
				list = noticeService.searchTitle(keyword,offset);	
				listAll = noticeService.searchTitleSize(keyword);
			}else if(searchMenu.equals("content")) {
				list = noticeService.searchContent(keyword, offset);
				listAll = noticeService.searchContentSize(keyword);
			}else if(searchMenu.equals("writer")) {
				list = noticeService.searchWriter(keyword, offset);
				listAll = noticeService.searchWriterSize(keyword);
			}else if(searchMenu.equals("titleAndContent")) {
				list = noticeService.searchTitleAndContent(keyword, offset);
				listAll = noticeService.searchTitleAndContentSize(keyword);
			}
		}
		int pageSize=0;
		if(listAll.size()>=10 && listAll.size()%10==0 ) {
			pageSize=listAll.size()/10;
		}else {
			if(listAll.size()==0) {
				pageSize=0;
			}else {
				pageSize=listAll.size()/10+1;
			}
		}
		int nowPage =offset/10;
		int startPage = nowPage/10*10+1;
		int endPage = startPage+9;
		if(nowPage/10 == pageSize/10) {
			endPage=pageSize;
		}
		
		model.addAttribute("searchMenu", searchMenu);
		model.addAttribute("ps",pageSize/10);
		model.addAttribute("sp",startPage/10);
		model.addAttribute("keyword", keyword);
		model.addAttribute("offset", offset);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("notice", list);
		return "notice";
	}
	
	@RequestMapping(value="/noticeDetail")
	public String noticeDetail(Model model,int nbo) {
		NoticeVo vo =noticeService.selectContent(nbo);
//		noticeService.updateHitCount(nbo);
		model.addAttribute("detail", vo);
		return "noticeDetail";
	}
	@RequestMapping(value="/noticeWrite")
	public String noticeWrite(NoticeVo vo,Model model,HttpServletRequest request,HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;
		
		for(int i=0 ;i<cookies.length;i++) {
			if(cookies[i].getName().equals("noticeWrite")) {
				viewCookie=cookies[i];
			}
		}
		if(viewCookie==null) {
			Cookie newCookie = new Cookie("noticeWrite","write");
			response.addCookie(newCookie);
			noticeService.wirteBoardService(vo);
		}
		List<NoticeVo> list = noticeService.selectBoardAll();
		int nbo = list.get(0).getNbo();
		NoticeVo detail = noticeService.selectContent(nbo);
		model.addAttribute("detail", detail);
		
		return "noticeDetail";
	}
	
	@RequestMapping(value="/deleteBoard")
	public String deleteBoard(int qbno,String id,HttpServletResponse response) throws IOException {
		QnaBoardVo vo = qnaBoardService.selectContent(qbno);
		PrintWriter out =response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		if(id.equals(vo.getID())) {
			qnaBoardService.deleteBoard(qbno);
		}else {
			out.println("<script>alert('작성자가 아닙니다.'); location.href='qnaBoard?offset=0';</script>");
			out.flush();
			return "qnaBoard";
		}
		return "redirect:/qnaBoard?offset=0";
	}
	
	@RequestMapping(value="/modifyBoard")
	public String modifyBoard(Model model,int qbno, String id,HttpServletResponse response) throws IOException  {
		QnaBoardVo vo = qnaBoardService.selectContent(qbno);
		PrintWriter out =response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		if(!(id.equals(vo.getID()))) {
			out.println("<script>alert('작성자가 아닙니다.'); location.href='qnaBoard?offset=0';</script>");
			out.flush();
//			return "redirect:/qnaBoard?offset=0";
		}
		model.addAttribute("detail", vo);
		return "modifyBoard";
	}
	
	@RequestMapping(value="/modifyAction")
	public String modifyAction(Model model,int qbno, String content) {
		qnaBoardService.updateBoard(qbno, content);
		QnaBoardVo vo =qnaBoardService.selectContent(qbno);
		List<CommentVo> commentList = commentService.selectCommentService(qbno);
		List<CommentVo> reCommentList = new ArrayList<CommentVo>();
		for(CommentVo comment : commentList) {
			if(comment.getLevel()==1) {
				reCommentList.add(comment);
			}
		}
		model.addAttribute("reComment",reCommentList);
		model.addAttribute("comment", commentList);
		model.addAttribute("detail", vo);
		return "qnaDetail";
	}
}





















