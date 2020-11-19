package com.auction.vo;

public class AuctionVo {
	private int idx;
	private String ID;
	private int pno;
	private int myprice;
	private String buydate;
	private String pname;
	private String bestmoney;
	private String startmoney;
	private String moneyup;
	private int payment;
	private String getcustomer;
	private String admin;
	private String deal;
	
	public AuctionVo() {}

	public AuctionVo(String iD, int pno, int myprice) {
		super();
		ID = iD;
		this.pno = pno;
		this.myprice = myprice;
	}

	public AuctionVo(int idx, String iD, int pno, int myprice, String buydate) {
		super();
		this.idx = idx;
		ID = iD;
		this.pno = pno;
		this.myprice = myprice;
		this.buydate = buydate;
	}

	
	
	public String getStartmoney() {
		return startmoney;
	}

	public void setStartmoney(String startmoney) {
		this.startmoney = startmoney;
	}

	public String getMoneyup() {
		return moneyup;
	}

	public void setMoneyup(String moneyup) {
		this.moneyup = moneyup;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getDeal() {
		return deal;
	}

	public void setDeal(String deal) {
		this.deal = deal;
	}

	public String getGetcustomer() {
		return getcustomer;
	}

	public void setGetcustomer(String getcustomer) {
		this.getcustomer = getcustomer;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getMyprice() {
		return myprice;
	}

	public void setMyprice(int myprice) {
		this.myprice = myprice;
	}

	public String getBuydate() {
		return buydate;
	}

	public void setBuydate(String buydate) {
		this.buydate = buydate;
	}


	public String getBestmoney() {
		return bestmoney;
	}

	public void setBestmoney(String bestmoney) {
		this.bestmoney = bestmoney;
	}

	@Override
	public String toString() {
		return "AuctionVo [idx=" + idx + ", ID=" + ID + ", pno=" + pno + ", myprice=" + myprice + ", buydate=" + buydate
				+ ", pname=" + pname + ", bestmoney=" + bestmoney + "]";
	}
	
}
