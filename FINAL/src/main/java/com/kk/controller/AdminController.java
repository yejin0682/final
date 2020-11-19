package com.kk.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.auction.service.AdminService;
import com.auction.vo.AuctionVo;
import com.auction.vo.MemberVo;
import com.auction.vo.ProductVo;

@Controller
public class AdminController {
	@Autowired
	AdminService service;
	
	@RequestMapping(value = "/admin")
	public String admin() {
		return "admin";
	}
	@RequestMapping(value = "/admin/customer")
	public String customer(Model model) {
		List<MemberVo> list = service.showMember();
		for(MemberVo vo : list) {
			switch(vo.getGrade()) {
				case "a":
					vo.setGrade("vvip");
					break;
				case "b":
					vo.setGrade("vip");
					break;
				case "c":
					vo.setGrade("gold");
					break;
				case "d":
					vo.setGrade("silver");
					break;
				case "e":
					vo.setGrade("일반");
					break;
			}
		}
		model.addAttribute("list", list);
		return "customer";
	}
	@RequestMapping(value = "/admin/customer/info")
	public String info(String id, Model model) {
		List<AuctionVo> listP = service.saleItem(id);
		List<AuctionVo> listA = service.buyItem(id);
		model.addAttribute("sales", listP);
		model.addAttribute("purchase", listA);
		return "customerinfo";
	}
	@RequestMapping(value = "/admin/item")
	public String itemmanager(Model model,int offset,int admin,int deal) {
		List<ProductVo> listAll = new ArrayList<ProductVo>();
		List<ProductVo> list = new ArrayList<ProductVo>();
		if(admin<0 && deal<0) {
			listAll = service.showProduct();
			list = service.showProductPage(offset);
		}else if(admin>=0 && deal<0) {
			listAll = service.adminProduct(admin);
			list = service.adminProductPage(admin, offset);
		}else if(admin>=0 && deal>=0) {
			listAll = service.dealProduct(admin, deal);
			list = service.dealProductPage(admin, deal, offset);
		}
		int pageSize=0;
		if(listAll.size()>=10 && listAll.size()%10==0 ) {
			pageSize=listAll.size()/10;
		}else {
			pageSize=listAll.size()/10+1;
		}
		int nowPage =offset/10;
		int startPage = nowPage/10*10+1;
		int endPage = startPage+9;
		if(nowPage/10 == pageSize/10) {
			endPage=pageSize;
		}
		for(ProductVo vo : list) {
//			System.out.println(vo.getID()+","+vo.getPname()+","+vo.getGrade());
			switch(vo.getGrade()) {
				case "a":
					vo.setGrade("vvip");
					break;
				case "b":
					vo.setGrade("vip");
					break;
				case "c":
					vo.setGrade("gold");
					break;
				case "d":
					vo.setGrade("silver");
					break;
				case "e":
					vo.setGrade("일반");
					break;
			}
		}
		model.addAttribute("deal", deal);
		model.addAttribute("admin", admin);
		model.addAttribute("offset", offset);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("list", list);
		return "itemmanager";
	}

	@RequestMapping(value="/admin/approveItem")
	public String approveItem(int pno, Model model) {
		ProductVo vo = new ProductVo(pno, 1, 1);
		int result = service.updateAdmin(vo);
		if(result == 1) {
			System.out.println("승인함.");
		}
		model.addAttribute("result", result);
		return "redirect:/admin/item?offset=0&admin=0&deal=-1";
	}
	
	@RequestMapping(value="/admin/rejectItem")
	public String rejectItem(int pno, Model model) {
		ProductVo vo = new ProductVo(pno, 2, 0);
		int result = service.updateAdmin(vo);
		if(result == 1) {
			System.out.println("거부 완료.");
		}
		model.addAttribute("result", result);
		return "redirect:/admin/item?offset=0&admin=0&deal=-1";
	}
	
//	@RequestMapping(value = "/admin/chart")
//	public String chart(int pno, Model model) {
//		List<AuctionVo> list = service.chart(pno);	
//		model.addAttribute("list", list);
//		return "chart";
//	}

}
