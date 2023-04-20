package recommand_board;

import java.sql.Date;
import java.util.ArrayList;

import recommandrep.RecommandRepVo;

                    
public class RecommandBoardVo {
	private int num;
	private String writer;
	private Date w_date;
	private String title;
	private String content;
	private String path;
	private ArrayList<RecommandRepVo> reps;

	public RecommandBoardVo() {
	}

	public RecommandBoardVo(int num, String writer, Date w_date, String title, String content, String path
			) {
		super();
		this.num = num;
		this.writer = writer;
		this.w_date = w_date;
		this.title = title;
		this.content = content;
		this.path = path;
		
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

	public Date getW_date() {
		return w_date;
	}

	public void setW_date(Date w_date) {
		this.w_date = w_date;
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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public ArrayList<RecommandRepVo> getReps() {
		return reps;
	}

	public void setReps(ArrayList<RecommandRepVo> reps) {
		this.reps = reps;
	}

	@Override
	public String toString() {
		return "RecommandBoardVo [num=" + num + ", writer=" + writer + ", w_date=" + w_date + ", title=" + title
				+ ", content=" + content + ", path=" + path + "]";
	}
	
}

	