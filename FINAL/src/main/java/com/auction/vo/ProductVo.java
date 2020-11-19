package com.auction.vo;

import java.util.Arrays;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;


public class ProductVo {
	private int pno;
	private String pname;
	private MultipartFile[] multiparts;
	private String filenames;
	private String image;
	private String img1;
	private String img2;	
	private int price; 
	private String uploaddate; 
	private String deadlinedate;
	private int hitcount;
	private String ID;
	private int bestmoney;
	private int admin;
	private String category;
	private String auctionmenu;
	private int deal;
	private int count;
	private int timeout;
	private int startmoney;
	private int lastmoney;
	private int moneyup;
	private String grade;
	private String getcustomer;
	
	public ProductVo() {}

	
	public ProductVo(int pno, int admin, int deal) {
		this.pno = pno;
		this.admin = admin;
		this.deal = deal;
	}


	public ProductVo(String pname, String image, int price, String uploaddate, String deadlinedate, int hitcount,
			String iD, int bestmoney, int admin, String category, String auctionmenu) {
		super();
		this.pname = pname;
		this.image = image;
		this.price = price;
		this.uploaddate = uploaddate;
		this.deadlinedate = deadlinedate;
		this.hitcount = hitcount;
		ID = iD;
		this.bestmoney = bestmoney;
		this.admin = admin;
		this.category = category;
		this.auctionmenu = auctionmenu;
	}

	public ProductVo(String pname, String image, int price, String uploaddate, String deadlinedate, int hitcount,
			String iD, int bestmoney, int admin, String category, String auctionmenu, int deal) {
		super();
		this.pname = pname;
		this.image = image;
		this.price = price;
		this.uploaddate = uploaddate;
		this.deadlinedate = deadlinedate;
		this.hitcount = hitcount;
		ID = iD;
		this.bestmoney = bestmoney;
		this.admin = admin;
		this.category = category;
		this.auctionmenu = auctionmenu;
		this.deal = deal;
	}

	public ProductVo(String pname, String image, int price, String uploaddate, String deadlinedate, String iD,
			String category, String auctionmenu) {
		super();
		this.pname = pname;
		this.image = image;
		this.price = price;
		this.uploaddate = uploaddate;
		this.deadlinedate = deadlinedate;
		ID = iD;
		this.category = category;
		this.auctionmenu = auctionmenu;
	}

	




	public String getGetcustomer() {
		return getcustomer;
	}


	public void setGetcustomer(String getcustomer) {
		this.getcustomer = getcustomer;
	}


	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	public String getImg1() {
		return img1;
	}


	public void setImg1(String img1) {
		this.img1 = img1;
	}


	public String getImg2() {
		return img2;
	}


	public void setImg2(String img2) {
		this.img2 = img2;
	}


	public String getFilenames() {
		return filenames;
	}


	public void setFilenames(String filenames) {
		this.filenames = filenames;
	}


	public MultipartFile[] getMultiparts() {
		return multiparts;
	}


	public void setMultiparts(MultipartFile[] multiparts) {
		this.multiparts = multiparts;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public int getMoneyup() {
		return moneyup;
	}


	public void setMoneyup(int moneyup) {
		this.moneyup = moneyup;
	}


	public int getStartmoney() {
		return startmoney;
	}


	public void setStartmoney(int startmoney) {
		this.startmoney = startmoney;
	}


	public int getLastmoney() {
		return lastmoney;
	}


	public void setLastmoney(int lastmoney) {
		this.lastmoney = lastmoney;
	}


	public int getTimeout() {
		return timeout;
	}


	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}


	public int getPno() {
		return pno;
	}



	public void setPno(int pno) {
		this.pno = pno;
	}



	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getUploaddate() {
		return uploaddate;
	}

	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
	}

	public String getDeadlinedate() {
		return deadlinedate;
	}

	public void setDeadlinedate(String deadlinedate) {
		this.deadlinedate = deadlinedate;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public int getBestmoney() {
		return bestmoney;
	}

	public void setBestmoney(int bestmoney) {
		this.bestmoney = bestmoney;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getAuctionmenu() {
		return auctionmenu;
	}

	public void setAuctionmenu(String auctionmenu) {
		this.auctionmenu = auctionmenu;
	}

	public int getDeal() {
		return deal;
	}

	public void setDeal(int deal) {
		this.deal = deal;
	}

	
	
}
