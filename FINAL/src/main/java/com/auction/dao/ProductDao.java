package com.auction.dao;

import java.util.List;

import com.auction.vo.AuctionVo;
import com.auction.vo.ProductVo;

public interface ProductDao {
	int insertProduct(ProductVo vo);
	ProductVo selectOne(int pno);
	List<ProductVo> selectAuction();
	List<ProductVo> selectAuctionBlind();
	List<ProductVo> selectPop();
	List<ProductVo> selectHurry();
	int insertAuction(AuctionVo vo,String auctionmenu,int diff, int myDiff);
	List<ProductVo> showNormalCategory(String category);
	List<ProductVo> showBlindCategory(String category);
	int dealChage(int pno);
	int hitcountUp(int pno);
	
	public AuctionVo blindCharge(int pno);
	int addLike(String str, String ID);
	String selectLike(String ID);
	
	List<ProductVo> searchProduct(String keyword);
	List<Integer> auctionPno(String id);
	AuctionVo maxPrice(int pno, String id);
	int rejectBlind(String id, int pno);
	
	public void payment(int pno);
	List<ProductVo> selectSales(String ID);
}
