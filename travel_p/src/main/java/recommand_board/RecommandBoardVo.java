package recommand_board;

import java.sql.Date;
import java.util.ArrayList;

import recommandrep.RecommandRepVo;

                    
public class RecommandBoardVo {
	private int num;
	private String writer;
	private String title;
	private String content;
	private Date w_date;
	private String pic1;
	private String pic2;
	

	public RecommandBoardVo() {
	}


	public RecommandBoardVo(int num, String writer, String title, String content, Date w_date, String pic1,
			String pic2) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.w_date = w_date;
		this.pic1 = pic1;
		this.pic2 = pic2;
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


	public Date getW_date() {
		return w_date;
	}


	public void setW_date(Date w_date) {
		this.w_date = w_date;
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


	@Override
	public String toString() {
		return "RecommandBoardVo [num=" + num + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", w_date=" + w_date + ", pic1=" + pic1 + ", pic2=" + pic2 + "]";
	}
	
	
	
	
}

	