package auctionboard;

import java.sql.Timestamp;

public class AuctionDataBean {
	private int itemnum; // number
	private int startprice; // 시작 가격 & 최고입찰가
	private String title; // 제목
	private String content; // 내용
	private Timestamp endDate; // 끝나는 날짜
	private Timestamp regDate; // 등록 날짜
	private int bidCount; // 입찰 수
	private int count; // 조횟 수
	private String writer; // 작성자
	private int price;	// 즉구가
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getItemnum() {
		return itemnum;
	}
	public void setItemnum(int itemnum) {
		this.itemnum = itemnum;
	}
	public int getStartprice() {
		return startprice;
	}
	public void setStartprice(int startprice) {
		this.startprice = startprice;
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
	public Timestamp getEndDate() {
		return endDate;
	}
	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getBidCount() {
		return bidCount;
	}
	public void setBidCount(int bidCount) {
		this.bidCount = bidCount;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
	
}
