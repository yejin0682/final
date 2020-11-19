package com.auction.dao;

import java.util.List;

import com.auction.vo.AuctionVo;
import com.auction.vo.MemberVo;
import com.auction.vo.ProductVo;

public interface AdminDao {
	List<ProductVo> dealProduct(int admin, int deal);
	List<ProductVo> dealProductPage(int admin, int deal,int offset);
	List<ProductVo> adminProduct(int admin);
	List<ProductVo> adminProductPage(int admin,int offset);
	List<ProductVo> showProduct();
	List<ProductVo> showProductPage(int offset);
	List<MemberVo> showMember();
	List<AuctionVo> saleItem(String ID);
	List<AuctionVo> buyItem(String ID);
	int updateAdmin(ProductVo vo);
	List<AuctionVo> chart(int pno);
	
}
