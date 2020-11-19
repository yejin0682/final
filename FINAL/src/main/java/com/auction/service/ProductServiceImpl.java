package com.auction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.ProductDao;
import com.auction.vo.AuctionVo;
import com.auction.vo.ProductVo;
@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDao dao;
	
	@Override
	public int insertProduct(ProductVo vo) {
		return dao.insertProduct(vo);
	}

	@Override
	public ProductVo selectOne(int pno) {
		return dao.selectOne(pno);
	}

	@Override
	public List<ProductVo> selectPop() {
		return dao.selectPop();
	}

	@Override
	public List<ProductVo> selectHurry() {
		return dao.selectHurry();
	}

	@Override
	public List<ProductVo> selectAuction() {
		return dao.selectAuction();
	}

	@Override
	public List<ProductVo> selectAuctionBlind() {
		return dao.selectAuctionBlind();
	}

	@Override
	public List<ProductVo> showNormalCategory(String category) {
		return dao.showNormalCategory(category);
	}

	@Override
	public List<ProductVo> showBlindCategory(String category) {
		return dao.showBlindCategory(category);
	}

	@Override
	public int insertAuction(AuctionVo vo,String auctionmenu,int diff, int myDiff) {
		return dao.insertAuction(vo,auctionmenu,diff,myDiff);
	}

	@Override
	public int dealChage(int pno) {
		return dao.dealChage(pno);
	}

	@Override
	public AuctionVo blincCharge(int pno) {
		return dao.blindCharge(pno);
	}

	@Override
	public int addLike(String str, String ID) {
		return dao.addLike(str, ID);
	}

	@Override
	public int hitcountUp(int pno) {
		return dao.hitcountUp(pno);
	}

	@Override
	public String selectLike(String ID) {
		return dao.selectLike(ID);
	}
	@Override
	public List<ProductVo> searchProduct(String keyword){
		return dao.searchProduct(keyword);
	}

	@Override
	public List<Integer> auctionPno(String id) {
		return dao.auctionPno(id);
	}

	@Override
	public AuctionVo maxPrice(int pno,String id) {
		return dao.maxPrice(pno,id);
	}

	@Override
	public int rejectBlind(String id, int pno) {
		return dao.rejectBlind(id, pno);
	}

	@Override
	public void payment(int pno) {
		dao.payment(pno);
	}

	@Override
	public List<ProductVo> selectSales(String ID) {
		return dao.selectSales(ID);
	}

}
