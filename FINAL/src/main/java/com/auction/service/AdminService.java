package com.auction.service;

import java.util.List;

import com.auction.vo.AuctionVo;
import com.auction.vo.MemberVo;
import com.auction.vo.ProductVo;

public interface AdminService {
	List<ProductVo> dealProduct(int admin, int deal);
	List<ProductVo> dealProductPage(int admin, int deal,int offset);
	List<ProductVo> adminProduct(int admin);
	List<ProductVo> adminProductPage(int admin,int offset);
	List<ProductVo> showProduct();
	List<MemberVo> showMember();
	List<AuctionVo> saleItem(String ID);
	List<AuctionVo> buyItem(String ID);
	List<ProductVo> showProductPage(int offset);
	int updateAdmin(ProductVo vo);
	List<AuctionVo> chart(int pno);
}
