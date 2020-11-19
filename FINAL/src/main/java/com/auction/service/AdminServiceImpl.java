package com.auction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.AdminDao;
import com.auction.vo.AuctionVo;
import com.auction.vo.MemberVo;
import com.auction.vo.ProductVo;
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDao dao;
	

	@Override
	public List<ProductVo> showProduct() {
		return dao.showProduct();
	}

	@Override
	public List<ProductVo> dealProduct(int admin, int deal) {
		return dao.dealProduct(admin, deal);
	}

	@Override
	public List<ProductVo> adminProduct(int admin) {
		return dao.adminProduct(admin);
	}

	@Override
	public List<AuctionVo> saleItem(String ID) {
		return dao.saleItem(ID);
	}

	@Override
	public List<AuctionVo> buyItem(String ID) {
		return dao.buyItem(ID);
	}

	@Override
	public List<ProductVo> showProductPage(int offset) {
		return dao.showProductPage(offset);
	}

	@Override
	public int updateAdmin(ProductVo vo) {
		return dao.updateAdmin(vo);
	}
	@Override
	public List<MemberVo> showMember() {
		return dao.showMember();
	}


	@Override
	public List<ProductVo> adminProductPage(int admin, int offset) {
		return dao.adminProductPage(admin, offset);
	}

	@Override
	public List<AuctionVo> chart(int pno) {
		return dao.chart(pno);
	}
	public List<ProductVo> dealProductPage(int admin, int deal, int offset) {
		return dao.dealProductPage(admin, deal, offset);
	}
}
