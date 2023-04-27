package comment;

import java.sql.Date;

public class CommentVo {
	private int num;
	private int board_num;
	private String content;
	private String user_id;
	private Date date;
	
	public CommentVo() {
		
	}
	
	public CommentVo(int num, int board_num, String content, String user_id, Date date) {
		super();
		this.num = num;
		this.board_num = board_num;
		this.content = content;
		this.user_id = user_id;
		this.date = date;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "CommentVo [num=" + num + ", board_num=" + board_num + ", content=" + content + ", user_id=" + user_id
				+ ", date=" + date + "]";
	}
	
	
	
	
}
