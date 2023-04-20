package record_board;

import java.sql.Date;

public class RecordBoardVo {
	private int num;
	private String writer;
	private String title;
	private String content;
	private String price;
	private Date rdate;
	private String pic1;
	private String pic2;
	private String pic3;
	private int cnt;
	
	public RecordBoardVo() {
		
	}
	public RecordBoardVo(int num, String writer, String title, String content, String price, Date rdate, String pic1,
			String pic2, String pic3, int cnt) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.price = price;
		this.rdate = rdate;
		this.pic1 = pic1;
		this.pic2 = pic2;
		this.pic3 = pic3;
		this.cnt = cnt;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public String getPic1() {
		return pic1;
	}
	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}
	public String getPic2() {
		return pic2;
	}
	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}
	public String getPic3() {
		return pic3;
	}
	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	@Override
	public String toString() {
		return "RecordBoardVo [num=" + num + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", price=" + price + ", rdate=" + rdate + ", pic1=" + pic1 + ", pic2=" + pic2 + ", pic3=" + pic3
				+ ", cnt=" + cnt + "]";
	}
}
