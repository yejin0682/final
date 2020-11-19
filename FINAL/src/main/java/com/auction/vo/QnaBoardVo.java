package com.auction.vo;

public class QnaBoardVo {
	private int qbno;
	private String title;
	private String content;
	private String ID;
	private String writedate;
	private int hitcount;
	private int ref;
	private int level;
	private int step;
	
	public QnaBoardVo() {}
	public QnaBoardVo(String title, String content, String iD) {
		this.title = title;
		this.content = content;
		ID = iD;
	}
	public int getQbno() {
		return qbno;
	}
	public void setQbno(int qbno) {
		this.qbno = qbno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getHitcount() {
		return hitcount;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	@Override
	public String toString() {
		return "QnaBoardVo [qbno=" + qbno + ", title=" + title + ", content=" + content + ", ID=" + ID + ", writedate="
				+ writedate + ", hitcount=" + hitcount + ", ref=" + ref + ", level=" + level + ", step=" + step + "]";
	}
	
}
