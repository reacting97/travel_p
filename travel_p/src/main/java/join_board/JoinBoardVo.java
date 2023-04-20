package join_board;

import java.sql.Date;

public class JoinBoardVo {
	private int num;
	private String writer;
	private String title;
	private String content;
	private Date w_date;
	private int parent;
	
	public JoinBoardVo(int num, String writer, String title, String content, Date w_date) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.w_date = w_date;
		
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

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	@Override
	public String toString() {
		return "JoinBoardVo [num=" + num + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", w_date=" + w_date + ", parent=" + parent + "]";
	}
	
	
}
	